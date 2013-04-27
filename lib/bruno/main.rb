module Bruno
  def self.is_ios?(file_content)
    !(file_content =~ /".*" = ".*";/).nil?
  end

  def self.is_android?(file_content)
    !(file_content =~ /<string name=".*">.*<\/string>/).nil?
  end
end
