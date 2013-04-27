module Bruno
  def self.is_ios?(file_path)
    content = File.read(file_path)
    !(content =~ /".*" = ".*";/).nil?
  end

  def self.is_android?(file_path)
    content = File.read(file_path)
    !(content =~ /<string name=".*">.*<\/string>/).nil?
  end
end
