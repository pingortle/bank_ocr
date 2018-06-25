RSpec.describe 'Integration' do
  it 'should return a successful code' do
    `exe/bank-ocr spec/fixtures/input.txt`
    expect($?.exitstatus).to eq 0
  end

  it 'should write the result to a file' do
    result = `exe/bank-ocr spec/fixtures/input.txt`
    expect(result).to eq <<-EXPECTED
000000000
111111111
123456789
EXPECTED
  end
end
