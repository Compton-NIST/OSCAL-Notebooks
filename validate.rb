require 'open-uri'
require 'nokogiri'
puts("Libraries loaded.")

xsd_url = "https://raw.githubusercontent.com/usnistgov/OSCAL/main/xml/schema/oscal_ssp_schema.xsd"
#xml_url = "https://raw.githubusercontent.com/Compton-NIST/OSCAL-Notebooks/main/ssp-valid.xml"
xml_url = "https://raw.githubusercontent.com/Compton-NIST/OSCAL-Notebooks/main/ssp-NOT-valid.xml"
puts("URLs set.")

xsd_content = URI.open(xsd_url)
xsd = Nokogiri::XML::Schema(xsd_content)

xml_content = URI.open(xml_url)
doc = Nokogiri::XML(xml_content)
puts("Loaded XSD and XML files.")

@content = []
xsd.validate(doc).each do |error|
    @content.push(error.message)
end 

@content.each do |line|
    puts("- #{line}")
end
puts("#{@content.length} Error(s) Found.")


