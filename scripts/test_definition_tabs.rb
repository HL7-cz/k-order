# Render the local Liquid overrides with missing Czech translations, as in QA.
# Run: ruby scripts/test_definition_tabs.rb
require 'json'
require 'liquid'

root = File.expand_path('..', __dir__)
layout = File.read(File.join(root, 'ig-template/layouts/layout-profile-definitions.html'), encoding: 'UTF-8')
fragment = File.read(File.join(root, 'ig-template/includes/fragment-modelType.html'), encoding: 'UTF-8')
strings = { 'en' => {
  'ResourceModel' => 'Resource Model', 'ResourceProfile' => 'Resource Profile',
  'LogicalModel' => 'Logical Model', 'Extension' => 'Extension', 'DataTypeProfile' => 'Data Type',
  'KeyElementsTable' => 'Key Elements', 'DifferentialTable' => 'Differential',
  'SnapshotTable' => 'Snapshot', 'DetailedDescriptions' => 'Detailed Descriptions'
} }
definitions = {
  'profile' => { 'kind' => 'resource', 'derivation' => 'constraint', 'type' => 'Bundle' },
  'resource' => { 'kind' => 'resource', 'derivation' => 'specialization', 'type' => 'Patient' },
  'logical' => { 'kind' => 'logical', 'derivation' => 'specialization', 'type' => 'Model' },
  'extension' => { 'kind' => 'complex-type', 'derivation' => 'constraint', 'type' => 'Extension' }
}
data_path = File.join(root, 'temp/pages/_data/structuredefinitions.json')
definitions.merge!(JSON.parse(File.read(data_path, encoding: 'UTF-8'))) if File.exist?(data_path)

count = 0
definitions.each do |id, definition|
  %w[cs en].each do |lang|
    source = layout.sub(/\A---\s*\n---\s*\n/, '')
    source = source.gsub(/\{% include fragment-modelType\.html .*?%\}/, fragment)
    # Includes only supply panel contents; keep a marker to verify visibility.
    source = source.gsub(/\{% include (.*?) %\}/) { "<span data-include=\"#{$1}\"></span>" }
    { '{{[id]}}' => id, '{{[type]}}' => 'StructureDefinition', '{{[lang]}}' => lang,
      '{{[langsuffix]}}' => "-#{lang}" }.each { |key, value| source = source.gsub(key, value) }
    output = Liquid::Template.parse(source).render!(
      'site' => { 'data' => { 'stringsBase' => strings, 'structuredefinitions' => definitions } },
      'include' => { 'type' => 'StructureDefinition', 'id' => id, 'lang' => lang }
    )
    links = output.scan(/href="#(tabs-[^"]+)"/).flatten
    targets = output.scan(/id="(tabs-[^"]+)"/).flatten
    raise "Unresolved tab: #{id}/#{lang}" unless (links - targets).empty? && (targets - links).empty?
    resource = definition['kind'] == 'resource' && definition['derivation'] == 'specialization'
    expected = resource ? %w[tabs-snap] : %w[tabs-key tabs-diff tabs-snap]
    raise "Wrong panels: #{id}/#{lang}" unless links == expected
    raise "Empty tab label: #{id}/#{lang}" if output.match?(/href="#tabs-[^"]+">\s*<\/a>/)
    raise "Missing model label: #{id}/#{lang}" unless output.match?(/<h2 id="root">\S/)
    count += 1
  end
end
puts "PASS: #{count} rendered definition pages; matching tab links and panels, nonempty labels in cs/en"
