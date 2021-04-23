require 'rspec'
require 'date'
require './lib/key'

describe Key do
  describe '#instantiation' do
    it 'exists' do
      key = Key.new(00000)

      expect(key).is_a? Shift
    end

    it 'has attributes' do
      allow(Date).to receive(:today).and_return(Date.new(2020, 8, 27))

      expect(key.key).to eq 00000
      expect(key.date).to eq ('08/27/2020')
      expect(key.shifts).to eq ([])
    end
  end
end 
