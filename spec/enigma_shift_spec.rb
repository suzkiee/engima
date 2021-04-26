require 'rspec'
require 'date'
require './lib/enigma_shift'

describe EnigmaShift do
  describe '#initialize' do
    it 'exists' do
      enigma_shift = EnigmaShift.new

      expect(enigma_shift).is_a? EnigmaShift
    end

    it 'has attributes' do
      enigma_shift = EnigmaShift.new

      expect(enigma_shift.shifts).to eq ([])
    end
  end

  describe '#generate_enigma_keys' do
    it 'can generate keys wtih enigma key' do
      enigma_shift = EnigmaShift.new
      expected = {:A => 02, :B => 23, :C => 34, :D => 45}
 
      expect(enigma_shift.generate_enigma_keys('02345')).to eq expected
    end
  end

  describe '#convert_to_pairs' do
    it 'converts enigma key to digit pairs ' do
      enigma_shift = EnigmaShift.new
      expected = ['12', '23', '34', '45']

      expect(enigma_shift.convert_to_pairs('12345')).to eq expected
    end
  end

  describe '#generate_offsets' do
    it 'generates offset from date' do
      expected = { :A => 2, :B => 4, :C => 0, :D => 0 }

      expect(enigma_shift.generate_offsets('270820')).to eq expected
    end 
  end

  describe '#convert_date' do
    it 'converts date into digits' do
      enigma_shift = EnigmaShift.new
  
      expect(enigma_shift.convert_date('270820')).to eq '2400'
    end
  end

  describe '#create_shifts' do
    it 'assign sum of key and offset to shift' do
      enigma_shift.create_shifts('12345', '270820')
      expected = [14, 27, 34, 45]

      expect(enigma_shift.shifts).to eq expected 
    end
  end
end 
