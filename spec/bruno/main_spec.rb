require 'spec_helper'

describe Bruno do
  let(:ios_file) do
    ios_file_path = File.join('..','..','assets','Localizable.strings')
    File.read(File.expand_path(ios_file_path, __FILE__))
  end

  let(:android_file) do
    android_file_path = File.join('..','..','assets','strings.xml')
    File.read(File.expand_path(android_file_path, __FILE__))
  end

  describe '#is_ios?' do
    it 'true when the file is an iOS Localizable file' do
      expect(Bruno.is_ios?(ios_file)).to be_true
    end

    it 'false when is not an iOS Localizable file' do
      expect(Bruno.is_ios?(android_file)).to be_false
    end
  end

  describe '#is_android?' do
    it 'true when the file has strings in XML (Android)' do
      expect(Bruno.is_android?(android_file)).to be_true
    end

    it 'false when the file has not strings in XML (not Android)' do
      expect(Bruno.is_android?(ios_file)).to be_false
    end
  end
end
