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

    def is_ios?
      Bruno.is_ios?(@content)
    end

    def is_android?
      Bruno.is_android?(@content)
    end

    def to_ios
      return '' if @content == ''
      strings = get_strings_from_android
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
  end
end
