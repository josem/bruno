require 'spec_helper'

describe Bruno do
  let(:ios_file) do
    ios_file_path = File.join('..','..','assets','Localizable.strings')
    File.expand_path(ios_file_path, __FILE__)
  end

  let(:android_file) do
    android_file_path = File.join('..','..','assets','strings.xml')
    File.expand_path(android_file_path, __FILE__)
  end

  describe '#is_ios?' do
    it 'returns true when the file is an iOS Localizable file' do
      expect(Bruno.is_ios?(ios_file)).to be_true
    end

    it 'returns false when is not an ios file' do
      expect(Bruno.is_ios?(android_file)).to be_false
    end
  end

  describe '#is_android?' do
    it 'returns true when the file is a strings XML of Android' do
      expect(Bruno.is_android?(android_file)).to be_true
    end

    it 'returns false when the file is not a strings XML of Android' do
      expect(Bruno.is_android?(ios_file)).to be_false
    end
  end
end
