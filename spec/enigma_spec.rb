require 'rspec'
require './lib/enigma'
require './lib/algorithm'

describe Enigma do
  describe '#initialize' do
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
      allow(EnigmaShift).to receive(:random_key) {'12345'}
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
end