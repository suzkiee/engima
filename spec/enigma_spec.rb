require 'rspec'
require './lib/enigma'
require './lib/algorithm'

describe Enigma do
  describe '::initialize' do
    it 'exists' do
      enigma = Enigma.new
      
      expect(enigma).is_a? Enigma
    end
  end

  describe '#encrypt' do
    it 'encrypts message with key and date' do
      enigma = Enigma.new
      expected = {
        :encryption => 'keder ohulw',
        :key        => '02715',
        :date       => '040895'
      }

      expect(enigma.encrypt('Hello World', '02715', '040895')).to eq expected
    end

    it 'encrypts message with key' do
      allow(Date).to receive(:today).and_return(Date.new(1995, 8, 04))
      enigma = Enigma.new
      expected = {
        :encryption => 'keder ohulw',
        :key        => '02715',
        :date       => '040895'
      }

      expect(enigma.encrypt('Hello World', '02715')).to eq expected
    end

    it 'encrypts message with only message' do
      allow(Date).to receive(:today).and_return(Date.new(1995, 8, 04))
      enigma = Enigma.new
      allow(enigma).to receive(:random_key) { '12345' }
      expected = {
        :encryption => 'uauha!ekdhm',
        :key        => '12345',
        :date       => '040895'
      }
 
      expect(enigma.encrypt('Hello!World')).to eq expected
    end
  end

  describe '#decrypt' do
    it 'decrypts message with key and date' do
      enigma = Enigma.new
      expected = {
        :decryption => 'hello world',
        :key        => '02715',
        :date       => '040895'
      }

      expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq expected
    end

    it 'decrypts message with key' do
      allow(Date).to receive(:today).and_return(Date.new(1995, 8, 04))
      enigma = Enigma.new
      expected = {
        :decryption => 'hello world',
        :key        => '02715',
        :date       => '040895'
      }
      
      expect(enigma.decrypt('keder ohulw', '02715')).to eq expected
    end
  end  

  describe '#random key' do
    it 'generates random 5 digit number as string' do
      enigma = Enigma.new

      expect(enigma.random_key).is_a? String
      expect(enigma.random_key.length).to eq 5
    end
  end

  describe '#algorithm' do
    it 'creates instance of algorithm' do
      enigma = Enigma.new
      
      expect(enigma.algorithm).is_a? Algorithm
    end
  end
end