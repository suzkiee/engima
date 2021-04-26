require 'rspec'
require './lib/algorithm'
require './lib/enigma_shift'

describe Algorithm do
  describe '#initialize' do
    it 'exists' do
      algorithm = Algorithm.new

      expect(algorithm).is_a? Algorithm 
    end
  end

  describe '#shift_forward' do
    it 'shifts letters forward' do

      expect(Algorithm.shift_forward('Hello World', '02715', '040895')).to eq 'keder ohulw'
    end

    it 'encyrpts character as itself if character not in chracter set' do

      expect(Algorithm.shift_forward('Hello World!', '02715', '040895')).to eq 'keder ohulw!'
    end
  end

  describe '#shift_backward' do
    it 'shifts letters backward' do

      expect(Algorithm.shift_backward('keder ohulw', '02715', '040895')).to eq 'hello world'
    end

    it 'decrypts character as itself if character not in chracter set' do

      expect(Algorithm.shift_backward('keder ohulw!', '02715', '040895')).to eq 'hello world!'
    end
  end
end