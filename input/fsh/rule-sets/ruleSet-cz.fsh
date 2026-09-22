RuleSet: SetFmmandStatusRule ( fmm, status )
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = {fmm}
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status].valueCode = #{status}

RuleSet: SetFmmandStatusRuleInstance ( fmm, status )
// Rule to be used for Instances
* extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = {fmm}
* extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status].valueCode = #{status}

RuleSet: ExtensionContext(path)
// copied by mCode
* ^context[+].type = #element
* ^context[=].expression = "{path}"

RuleSet: SNOMEDCopyrightForVS
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* ^experimental = false

RuleSet: SectionComRules (short, def, code)
// * insert (Health Concern Section, test, http://loinc.org#75310-3)
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
* ^extension[0].valueString = "Section"
* ^short = "{short}"
* ^definition = "{def}"
* title 1..
* code 1..
* code = {code}
* text only Narrative

// Adds a language-specific XHTML wrapper to Narrative content.
// Use [[...]] for content so commas and closing parentheses do not need escaping.
RuleSet: CzechNarrative(content)
* text.div = """<div xmlns="http://www.w3.org/1999/xhtml" lang="cs" xml:lang="cs">{content}</div>"""

RuleSet: EnglishNarrative(content)
* text.div = """<div xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">{content}</div>"""


RuleSet: SliceElement( type, path )
* ^slicing.discriminator.type = {type}
* ^slicing.discriminator.path = "{path}"
* ^slicing.rules = #open
* ^slicing.ordered = false

RuleSet: ImposeProfile ( profile, index )
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-imposeProfile][{index}].valueCanonical = {profile}

RuleSet: ValuSetSupplementRule (codeSystem)
* ^extension[http://hl7.org/fhir/StructureDefinition/valueset-supplement].valueCanonical = {codeSystem}