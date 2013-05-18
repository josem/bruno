require 'nokogiri'

module Bruno
  class StringsFile
    def initialize(file_path)
      if File.readable?(file_path)
        @content = File.read(file_path)
      else
        raise 'File is not readable'
      end
    end

    def transform(path)
      if is_ios?
        to_android(path)
      elsif is_android?
        to_ios(path)
      end
    end

    def is_ios?
      Bruno.is_ios?(@content)
    end

    def is_android?
      Bruno.is_android?(@content)
    end

    def to_ios(ios_file_path)
      return if @content == ''
      strings = get_strings_from_android
      write_ios_file(ios_file_path, strings)
    end

    def to_android(android_file_path)
      return if @content == ''
      strings = get_strings_from_ios
      write_android_file(android_file_path, strings)
    end

    private
    def get_strings_from_android
      strings = []
      xml = Nokogiri::XML(@content)
      xml.root.xpath('string').each do |string|
        strings << {:key => string.attribute('name').value, :value => string.content}
      end

      strings
    end

    def get_strings_from_ios
      strings = []
      @content.each_line do |line|
        match_key = line.match(/\"([^\"]+)\"/)
        match_value = line.match(/= \"([^\"]+)\";/)
        strings << {:key => match_key[1], :value => match_value[1]}
      end
      strings
    end

    def compose_ios_line(key, value)
      '"' + key + '" = "' + value + '";'
    end

    def write_ios_file(path, strings)
      ios_file = File.new(path,'w+')

      strings.each_with_index do |string, index|
        ios_file.write(compose_ios_line(string[:key], string[:value]))

        if index != strings.length - 1
          ios_file.write("\n")
        end
      end
      ios_file.close
    end

    def write_android_file(path, strings)
      android_file = File.new(path, 'w+')
      builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
        xml.resources {
          strings.each do |string|
            xml.string({:name => string[:key]}) { xml.text string[:value] }
          end
        }
      end
      android_file.write(builder.to_xml)
      android_file.close
    end
  end
end
