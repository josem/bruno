require 'spec_helper'

describe Bruno::StringsFile do
  let (:android_path) { File.expand_path(File.join('spec','assets','strings.xml')) }

  describe '#initialize' do
    it 'raises an error if file is not readable' do
      expect { Bruno::StringsFile.new('') }.to raise_error
    end
  end

  describe 'to_ios' do
    it 'is empty if the content of the original file is empty' do
      file = Bruno::StringsFile.new(android_path)
    end
  end
end
