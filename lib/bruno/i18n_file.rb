module Bruno
  class I18nFile
    attr_writer :strings

    def initialize(strings)
      @strings = strings
    end

    def self.read(path)
      if !File.readable?(path)
        raise 'File is not readable'
      end

      content = File.read(path)

      if is_ios?(content)
        AndroidFile.new(IOSFile.read(content))
      elsif is_android?(content)
        IOSFile.new(AndroidFile.read(content))
      else
        raise 'Format of the file is not correct'
      end
    end

    def self.is_android?(content)
      !(content =~ /<string name=".*">.*<\/string>/).nil?
    end

    def self.is_ios?(content)
      !(content =~ /".*" = ".*";/).nil?
    end
  end
end