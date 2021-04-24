require 'rspec'
require 'date'
require './lib/enigma_shift'

describe EnigmaShift do
  describe '#instantiation' do
    it 'exists' do
      enigma_shift = EnigmaShift.new

      expect(enigma_shift).is_a? EnigmaShift
    end

    it 'has attributes' do
      allow(Date).to receive(:today).and_return(Date.new(2020, 8, 27))
      enigma_shift = EnigmaShift.new

      expect(enigma_shift.enigma_key).to eq 0
      expect(enigma_shift.date).to eq ('27/08/20')
      expect(enigma_shift.shifts).to eq ([])
    end
  end

  describe '#generate_enigma_shift' do
    it 'can generate keys wtih enigma key' do
      enigma_shift = EnigmaShift.new('02345')
      expected = {:A => 02, :B => 23, :C => 34, :D => 45}
 
      expect(enigma_shift.generate_enigma_keys).to eq expected
    end

    it 'can generate keys with random key numbers' do
      enigma_shift = EnigmaShift.new
      allow(enigma_shift).to receive(:generate_random_key) {'12345'}
      expected = {:A => 12, :B => 23, :C => 34, :D => 45}

      expect(enigma_shift.generate_enigma_keys).to eq expected 
    end
  end

  describe '#convert_to_pairs' do
    it 'converts enigma key to digit pairs ' do
      enigma_shift = EnigmaShift.new('12345')
      expected = ['12', '23', '34', '45']

      expect(enigma_shift.convert_to_pairs('12345')).to eq expected
    end
  end

  # describe '#generate_offset' do
  #   it 'generates offset from date' do
  #     enigma_shift = EnigmaShift.new
  #     allow(Date).to receive(:today).and_return(Date.new(2020, 8, 27))

  #     expected = { :A => 2, :B => 4, :C => 0, :D => 0 }

  #     expect(enigma_shift.generate_offset).to eq expected
  #   end 
  # end
end 
