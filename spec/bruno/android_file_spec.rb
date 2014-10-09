require 'spec_helper'

describe Bruno::AndroidFile do
  let(:android_path) { File.expand_path(File.join('spec','assets','strings.xml')) }
  let(:android_content) { File.read(android_path) }

  let(:ios_path) { File.expand_path(File.join('spec','assets','Localizable.strings')) }
  let(:ios_content) { File.read(ios_path) }

  let (:array_hashes) {[{:key=>"APP_NAME", :value=>"Test App"},
                      {:key=>"TITLE_ACTIVITY_MAIN", :value=>"Test"},
                      {:key=>"INFO_TITLE", :value=>"Information"},
                      {:key=>"INFO_SUBTITLE", :value=>"More information"}] }


  describe '#self.is_android?' do
    it 'is true when the content has strings in XML (Android)' do
      expect(described_class.is_android?(android_content)).to be true
    end

    it 'is false when the content has not strings in XML (not Android)' do
      expect(described_class.is_android?(ios_content)).to be false
    end
  end

  describe '#self.read' do
    it 'returns array of hashes with keys and values' do
      expect(described_class.read(android_content)).to eq array_hashes
    end
  end

  describe '#write' do
    it 'converts the strings to Android i18n file' do
      android_file = described_class.new(array_hashes)
      file = Tempfile.new('strings.xml')
      android_file.write(file.path)
      expect(File.read(file.path)).to eq (File.read(android_path))
      file.unlink
    end
  end
end
