require 'nokogiri'

class Bruno::AndroidFile < Bruno::I18nFile
  def self.is_android?(content)
    !(content =~ /<string name=".*">.*<\/string>/).nil?
  end

  def self.read(content)
    strings = []
    xml = Nokogiri::XML(content)
    xml.root.xpath('string').each do |string|
      strings << {:key => string.attribute('name').value, :value => string.content}
    end

    strings
  end

  def write(path)
    file = File.new(path, 'w+')
    builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
      xml.resources {
        @strings.each do |string|
          xml.string({:name => string[:key]}) { xml.text string[:value] }
        end
      }
    end
    file.write(builder.to_xml)
    file.close
  end
end