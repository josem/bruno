module Bruno
  class File
    def initialize(file_path)
      @content = File.read(file_path)
    end

    def is_ios?
      Bruno.is_ios?(@content)
    end

    def is_android?
      Bruno.is_android?(@content)
    end
  end
end
