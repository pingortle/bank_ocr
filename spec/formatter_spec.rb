RSpec.describe BankOcr::Formatter do
  describe '#format' do
    it 'should put each code on its own line' do
      result = subject.format [
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [1, 1, 1, 1, 1, 1, 1, 1, 1]
      ]

      expected = <<-END
000000000
111111111
END
      expect(result).to eq expected.chomp
    end
  end
end