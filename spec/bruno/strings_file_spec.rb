require 'spec_helper'

describe Bruno::StringsFile do
  let (:android_path) { File.expand_path(File.join('spec','assets','strings.xml')) }
  let (:ios_path) { File.expand_path(File.join('spec','assets','Localizable.strings')) }
  let (:array_hashes) {[{:key=>"app_name", :value=>"Test App"},
                        {:key=>"title_activity_main", :value=>"Test"},
                        {:key=>"info_title", :value=>"Information"},
                        {:key=>"info_subtitle", :value=>"More information"}] }

  describe '#initialize' do
    it 'raises an error if file is not readable' do
      expect { Bruno::StringsFile.new('') }.to raise_error
    end
  end

  describe '#get_strings_from_android' do
    it 'returns array of hashes with keys and values' do
      strings_file = Bruno::StringsFile.new(android_path)

      expect(strings_file.send(:get_strings_from_android)).to eq array_hashes
    end
  end

  describe '#to_ios' do
    it 'converts the strings file to Localizable.strings' do
      # file = Bruno::StringsFile.new(android_path)
      # expect(file.to_ios).to eq File.read(ios_path)
      pending
    end

    it 'is empty if the content of the original file is empty' do
      file = Bruno::StringsFile.new('/dev/null')
      expect(file.to_ios).to eq ''
    end

  end
end
