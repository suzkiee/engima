require 'rspec'
require 'date'
require './lib/algorithm_helper'

describe AlgorithmHelper do
  describe '#initialize' do
    it 'exists' do
      algorithm_helper = AlgorithmHelper.new

      expect(algorithm_helper).is_a? EnigmaShift
    end

    it 'has attributes' do
      algorithm_helper = AlgorithmHelper.new

      expect(algorithm_helper.shifts).to eq ([])
    end
  end

  describe '#generate_enigma_keys' do
    it 'can generate keys wtih enigma key' do
      algorithm_helper = AlgorithmHelper.new
      expected = {:A => 02, :B => 23, :C => 34, :D => 45}
 
      expect(algorithm_helper.generate_enigma_keys('02345')).to eq expected
    end
  end

  describe '#convert_to_pairs' do
    it 'converts enigma key to digit pairs ' do
      algorithm_helper = AlgorithmHelper.new
      expected = ['12', '23', '34', '45']

      expect(algorithm_helper.convert_to_pairs('12345')).to eq expected
    end
  end

  describe '#generate_offsets' do
    it 'generates offset from date' do
      algorithm_helper = AlgorithmHelper.new
      expected = { :A => 2, :B => 4, :C => 0, :D => 0 }

      expect(algorithm_helper.generate_offsets('270820')).to eq expected
    end 
  end

  describe '#convert_date' do
    it 'converts date into digits' do
      algorithm_helper = AlgorithmHelper.new
  
      expect(algorithm_helper.convert_date('270820')).to eq '2400'
    end
  end

  describe '#create_shifts' do
    it 'assign sum of key and offset to shift' do
      algorithm_helper = AlgorithmHelper.new
  t(algorithm_helper.create_shifts('12345', '270820')
      expected = [14, 27, 34, 45]

      expect(algorithm_helper.shifts).to eq expected 
    end
  end

  describe '#create_letter_hash' do
    it 'creates hash with letters as keys' do
      algorithm_helper = AlgorithmHelper.new
      expected = { :A => nil, :B => nil, :C => nil, :D => nil}
      
      expect(algorithm_helper.create_letter_hash).to eq expected 
    end
  end

  describe '#assign_to_letter' do
    it 'Assigns digits as values to letters keys' do
      algorithm_helper = AlgorithmHelper.new
      letter_hash = { :A => nil, :B => nil, :C => nil, :D => nil}
      digits = [12, 13 , 14, 15]
      expected = { :A => 12, :B => 13, :C => 14, :D => 15}
    
      expect(algorithm_helper.assign_to_letter(letter_hash, digits)).to eq expected 
    end
  end
end 
