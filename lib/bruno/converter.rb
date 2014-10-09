module Bruno
  class Converter
    def self.convert(in_path, out_path)
      I18nFile.read(in_path).write(out_path)
    end
  end
end