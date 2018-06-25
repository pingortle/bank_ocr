RSpec.describe BankOcr::Processor do
  describe '#process' do
    let(:parser) { double :parser }
    let(:formatter) { double :formatter }
    let(:code_stream) { double :code_stream }

    subject { described_class.new parser: parser, formatter: formatter }

    it 'should process the OCR file' do
      expect(parser).to receive(:parse).with('some raw codes') { 'some parsed codes' }
      expect(formatter).to receive(:format).with('some parsed codes') { 'some formatted codes' }

      result = subject.process 'some raw codes'

      expect(result).to eq 'some formatted codes'
    end
  end
end
