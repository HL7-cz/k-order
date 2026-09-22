import json,re,urllib.request,urllib.parse,concurrent.futures
from pathlib import Path
ROOT=Path.cwd()
aliases=dict(re.findall(r'^Alias:\s+(\$\S+)\s*=\s*(\S+)',(ROOT/'input/fsh/alias.fsh').read_text(encoding='utf-8'),re.M))
items=[]
for file in sorted((ROOT/'input/fsh/exampels').glob('*.fsh')):
    systems={}
    for number,line in enumerate(file.read_text(encoding='utf-8').splitlines(),1):
        if line.startswith('Instance:'): systems={}
        short=re.match(r'^\* (\S+) = (\$[^#\s]+)#([^\s]+)(.*)$',line)
        if short:
            path,alias,code,tail=short.groups()
            uri=aliases[alias]; system,_,version=uri.partition('|')
            items.append(dict(file=str(file.relative_to(ROOT)),line=number,path=path,system=system,version=version,code=code,style='short',tail=tail))
        system_match=re.match(r'^\* (\S+)\.system = ("[^"]+"|\$\S+)',line)
        if system_match:
            path,value=system_match.groups()
            systems[path]=json.loads(value) if value.startswith('"') else aliases[value]
        code_match=re.match(r'^\* (\S+)\.code = #([^\s]+)',line)
        if code_match and code_match[1] in systems:
            path,code=code_match.groups()
            system,_,version=systems[path].partition('|')
            items.append(dict(file=str(file.relative_to(ROOT)),line=number,path=path,system=system,version=version,code=code,style='split'))
def key(i):return (i['system'],i['version'],i['code'])
pairs={key(i) for i in items}
local={}
def concepts(nodes):
    for c in nodes:
        yield c
        yield from concepts(c.get('concept',[]))
for package in ('hl7.fhir.cz.terminology#0.3.0','hl7.terminology.r4#7.3.0','hl7.fhir.r4.core#4.0.1'):
    for file in (Path.home()/'.fhir/packages'/package/'package').glob('CodeSystem-*.json'):
        cs=json.loads(file.read_text(encoding='utf-8'))
        system=cs.get('supplements',cs.get('url','')).split('|')[0]
        wanted={code for s,v,code in pairs if s==system}
        if not wanted:continue
        for c in concepts(cs.get('concept',[])):
            if c['code'] in wanted and 'display' in c:
                local.setdefault((system,'',c['code']),dict(display=c['display'],source=str(file),version=cs.get('version'),language=cs.get('language')))
results=[]
def resolve(k):
    system,version,code=k
    if k in local:return dict(system=system,requestedVersion=version,code=code,**local[k])
    params=dict(system=system,code=code,displayLanguage='cs',_format='json')
    if version:params['version']=version
    url='https://tx.fhir.org/r4/CodeSystem/$lookup?'+urllib.parse.urlencode(params)
    try:
        with urllib.request.urlopen(urllib.request.Request(url,headers={'Accept':'application/fhir+json'}),timeout=50) as r: body=json.load(r)
        display=next((p.get('valueString') for p in body.get('parameter',[]) if p['name']=='display'),None)
        if not display:raise ValueError(str(body)[:400])
        return dict(system=system,requestedVersion=version,code=code,display=display,source=url,response=body)
    except Exception as e:return dict(system=system,requestedVersion=version,code=code,error=str(e),source=url)
with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
    for row in pool.map(resolve,sorted(pairs)):
        results.append(row)
        print(json.dumps({k:v for k,v in row.items() if k!='response'},ensure_ascii=True),flush=True)
(ROOT/'.codex-validation/displays-resolved.json').write_text(json.dumps(dict(items=items,results=results),ensure_ascii=False,indent=2),encoding='utf-8')
print('Occurrences:',len(items),'concepts:',len(pairs),'unresolved:',sum('error' in r for r in results))
