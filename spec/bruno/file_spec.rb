require 'spec_helper'

describe Bruno::File do
  describe '#initialize' do
    it 'raises an error if file is not readable' do
      expect { Bruno::File.new('') }.to raise_error
    end
  end

  describe 'to_ios' do
  end
end
