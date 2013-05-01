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
      ios_content = ''

      ios_content
    end
  end
end
