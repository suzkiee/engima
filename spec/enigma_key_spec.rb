require 'rspec'
require 'date'
require './lib/enigma_key'

describe EnigmaKey do
  describe '#instantiation' do
    it 'exists' do
      enigma_key = EnigmaKey.new

      expect(enigma_key).is_a? EnigmaKey
    end

    it 'has attributes' do
      allow(Date).to receive(:today).and_return(Date.new(2020, 8, 27))
      enigma_key = EnigmaKey.new

      expect(enigma_key.key_number).to eq 00000
      expect(enigma_key.date).to eq ('08/27/20')
      expect(enigma_key.shifts).to eq ([])
    end
  end

  # Rethink how to test this
  # describe '#generate_random_key' do
  #   it 'generates random 5 digit key number' do
  #     enigma_key = EnigmaKey.new
     
  #     enigma_key.generate_random_key
  #     expect(enigma_key.key_number).to eq 12345 
  #   end
  # end

  describe '#generate_offset' do
    it '' do
      
    end
  end
end 
