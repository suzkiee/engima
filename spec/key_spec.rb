require 'rspec'
require 'date'
require './lib/key'

describe Key do
  describe '#instantiation' do
    it 'exists' do
      key = Key.new

      expect(key).is_a? Key
    end

    it 'has attributes' do
      allow(Date).to receive(:today).and_return(Date.new(2020, 8, 27))
      key = Key.new

      expect(key.key).to eq 00000
      expect(key.date).to eq ('08/27/20')
      expect(key.shifts).to eq ([])
    end
  end
  
  describe '#method' do
    it '#generate random key' do
      key = Key.new 
     
      key.generate_random_key
      expect(key.key).to eq 12345 
    end
  end
end 
