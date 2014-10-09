require 'spec_helper'

module Bruno
  describe Converter do
    let (:fake_android_path) { 'example.xml' }
    let (:fake_android_file) { Object.new }
    let (:fake_output_path)  { Object.new }

    describe '#convert' do
      it 'reads the file and writes a new one' do
        expect(I18nFile).to receive(:read).with(fake_android_path).and_return(fake_android_file)
        expect(fake_android_file).to receive(:write).with(fake_output_path)
        
        described_class.convert(fake_android_path, fake_output_path)
      end
    end
  end
end