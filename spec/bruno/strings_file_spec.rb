require 'spec_helper'

describe Bruno::StringsFile do
  describe '#initialize' do
    it 'raises an error if file is not readable' do
      expect { Bruno::StringsFile.new('') }.to raise_error
    end
  end

  describe 'to_ios' do
    it 'is empty if the content of the original file is empty' do
      file = Bruno::StringsFile.new('assets/strings.xml')
    end
  end
end
