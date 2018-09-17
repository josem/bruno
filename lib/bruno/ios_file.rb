class Bruno::IOSFile < Bruno::I18nFile
  def self.read(content)
    strings = []
    content.each_line do |line|
      match_key = line.match(/\"([^\"]+)\"/)
      match_value = line.match(/= \"([^\"]+)\";/) #"
      strings << {:key => match_key[1], :value => match_value[1]}
    end
    strings
  end

  def write(path)
    file = File.new(path,'w+')

    @strings.each_with_index do |string, index|
      file.write(compose_line(string[:key], string[:value]))

      if index != @strings.length - 1
        file.write("\n")
      end
    end
    file.close
  end


  private
  def compose_line(key, value)
    '"' + key + '" = "' + value + '";'
  end
end