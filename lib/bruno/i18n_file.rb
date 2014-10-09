module Bruno
  class I18nFile
    attr_writer :strings

    def initialize(strings)
      @strings = strings
    end

    def self.read(path)
      if File.readable?(path)
        content = File.read(path)

        if IOSFile.is_ios?(content)
          return AndroidFile.new(IOSFile.read(content))
        elsif AndroidFile.is_android?(content)
          return IOSFile.new(AndroidFile.read(content))
        else
          raise 'Format of the file is not correct'
        end
      else
        raise 'File is not readable'
      end
    end
  end
end