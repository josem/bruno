require 'spec_helper'

describe Bruno::IOSFile do
  let(:ios_path) { File.expand_path(File.join('spec','assets','Localizable.strings')) }
  let(:ios_content) { File.read(ios_path) }

  let (:array_hashes) {[{:key=>"APP_NAME", :value=>"Test App"},
                      {:key=>"TITLE_ACTIVITY_MAIN", :value=>"Test"},
                      {:key=>"INFO_TITLE", :value=>"Information"},
                      {:key=>"INFO_SUBTITLE", :value=>"More information"}] }

  describe '#self.read' do
    it 'returns array of hashes with keys and values' do
      expect(described_class.read(ios_content)).to eq array_hashes
    end
  end

  describe '#write' do
    it 'converts the strings to iOS i18n file' do
      ios_file = described_class.new(array_hashes)
      file = Tempfile.new('strings.xml')
      ios_file.write(file.path)
      expect(File.read(file.path)).to eq (File.read(ios_path))
      file.unlink
    end
  end
end
