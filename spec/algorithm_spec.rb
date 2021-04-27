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
      message = 'Hello World'
      enigma_key = '02175'
      date = '040895'
      crpyt = 'encrypt'

      expect(Algorithm.shift(message, enigma_key, date, crypt)).to eq 'keder ohulw'
    end

    it 'encyrpts character as itself if character not in chracter set' do
      message = 'Hello World!'
      enigma_key = '02175'
      date = '040895'
      crpyt = 'encrypt'

      expect(Algorithm.shift(message, enigma_key, date, crypt)).to eq 'keder ohulw!'
    end

    it 'shifts letters backward' do
      ciphertext = 'keder ohulw'
      enigma_key = '02175'
      date = '040895'
      crpyt = 'decrypt'

      expect(Algorithm.shift(ciphertext, enigma_key, date, crypt)).to eq 'hello world'
    end

    it 'decrypts character as itself if character not in character set' do
      ciphertext = 'keder ohulw'
      enigma_key = '02175'
      date = '040895'
      crpyt = 'decrypt'

      expect(Algorithm.shift(ciphertext, enigma_key, date, crypt)).to eq 'hello world!'
    end
  end
end