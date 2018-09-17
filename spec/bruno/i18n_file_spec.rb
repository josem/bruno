require 'spec_helper'

module Bruno
  describe I18nFile do
    let(:android_path) { File.expand_path(File.join('spec','assets','strings.xml')) }
    let(:ios_path) { File.expand_path(File.join('spec','assets','Localizable.strings')) }
    let(:wrong_file_path) { File.expand_path(File.join('spec','assets','wrong_strings.xml')) }
    let(:not_readable_file_path) { File.expand_path(File.join('spec','assets','example.xml')) }
    let(:android_content) { File.read(android_path) }
    let(:ios_content) { File.read(ios_path) }

    describe '#read' do
      it 'creates a new iOS file if Android' do
        expect(described_class.read(android_path)).to be_an(IOSFile)
      end

      it 'creates a new Android file if iOS' do
        expect(described_class.read(ios_path)).to be_an(AndroidFile)
      end

      it 'raises an exception if format not correct' do
        expect{described_class.read(wrong_file_path)}.to raise_error(RuntimeError)
      end

      it 'raises an exception if file not readable' do
        expect{described_class.read(not_readable_file_path)}.to raise_error(RuntimeError)
      end
    end

    describe '#self.is_ios?' do
      it 'is true when the content is in iOS format' do
        expect(described_class.is_ios?(ios_content)).to be true
      end

      it 'is false when the content is not in iOS format' do
        expect(described_class.is_ios?(android_content)).to be false
      end
    end

    describe '#self.is_android?' do
      it 'is true when the content has strings in XML (Android)' do
        expect(described_class.is_android?(android_content)).to be true
      end

      it 'is false when the content has not strings in XML (not Android)' do
        expect(described_class.is_android?(ios_content)).to be false
      end
    end
  end
end