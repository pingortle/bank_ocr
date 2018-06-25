RSpec.describe BankOcr::Parser do
  ZEROS = File.read 'spec/fixtures/zeros.txt'
  ONES = File.read 'spec/fixtures/ones.txt'
  ONE_THROUGH_NINE = File.read 'spec/fixtures/one_through_nine.txt'
  THREE_CODES = File.read 'spec/fixtures/three_codes.txt'

  describe '#parse' do
    it 'takes a row of zeros' do
      result = subject.parse ZEROS
      expect(result).to eq [[0, 0, 0, 0, 0, 0, 0, 0, 0]]
    end

    it 'takes a row of ones' do
      result = subject.parse ONES
      expect(result).to eq [[1, 1, 1, 1, 1, 1, 1, 1, 1]]
    end

    it 'takes a row of one through nine' do
      result = subject.parse ONE_THROUGH_NINE
      expect(result).to eq [[1, 2, 3, 4, 5, 6, 7, 8, 9]]
    end
    
    it 'takes more than one row' do
      result = subject.parse THREE_CODES
      expect(result).to eq [
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [1, 1, 1, 1, 1, 1, 1, 1, 1],
        [1, 2, 3, 4, 5, 6, 7, 8, 9]
      ]
    end
  end
end
