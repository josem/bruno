module Bruno
  class File
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

    end
  end
end
