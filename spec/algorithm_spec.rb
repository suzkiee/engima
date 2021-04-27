require 'rspec'
require './lib/algorithm'
require './lib/algorithm_helper'

describe Algorithm do
  describe '::initialize' do
    it 'exists' do
      algorithm = Algorithm.new

      expect(algorithm).is_a? Algorithm
    end
  end

  describe '::shift' do
    it 'shifts letters forward' do
      algorithm = Algorithm.new
      input = 'Hello World'
      enigma_key = '02715'
      date = '040895'
      crypt = 'encrypt'
      
      expect(algorithm.shift(input, enigma_key, date, crypt)).to eq 'keder ohulw'
    end

    it 'encyrpts character as itself if character not in chracter set' do
      algorithm = Algorithm.new
      input = 'Hello World!'
      enigma_key = '02715'
      date = '040895'
      crypt = 'encrypt'
      
      expect(algorithm.shift(input, enigma_key, date, crypt)).to eq 'keder ohulw!'
    end

    it 'shifts letters backward' do
      algorithm = Algorithm.new
      input = 'keder ohulw'
      enigma_key = '02715'
      date = '040895'
      crypt = 'decrypt'

      expect(algorithm.shift(input, enigma_key, date, crypt)).to eq 'hello world'
    end

    it 'decrypts character as itself if character not in character set' do
      algorithm = Algorithm.new
      input = 'keder ohulw!'
      enigma_key = '02715'
      date = '040895'
      crypt = 'decrypt'

      expect(algorithm.shift(input, enigma_key, date, crypt)).to eq 'hello world!'
    end
  end

  describe '#create shifts' do
    it 'creates shifts' do
      algorithm = Algorithm.new

      expect(algorithm.create_shifts('02715', '040895')).to eq ([3, 27, 73, 20])
    end
  end

  describe '#character_set' do
    it 'creates character set' do
      algorithm = Algorithm.new
      expected =["a", "b", "c", "d", "e", "f", "g", "h", "i",
                "j", "k", "l", "m", "n", "o", "p", "q", "r", 
                "s", "t", "u", "v", "w", "x", "y", "z", " "]

      expect(algorithm.character_set).to eq expected
    end
  end

  describe '#translate_input' do
    it 'creates encrypted string output' do
      algorithm = Algorithm.new
      input = 'Hello World'
      crypt = 'encrypt'
      shifts = [3, 27, 73, 20]

      expect(algorithm.translate_input(input, shifts, crypt)).to eq 'keder ohulw'
    end

    it 'creates decrypted string output' do
      algorithm = Algorithm.new
      input = 'keder ohulw'
      crypt = 'decrypt'
      shifts = [3, 27, 73, 20]

      expect(algorithm.translate_input(input, shifts, crypt)).to eq 'hello world'
    end
  end
end