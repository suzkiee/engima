require 'rspec'
require './lib/algorithm'
require './lib/enigma_shift'

describe Algorithm do
  describe '#initialize' do
    it 'exists' do
      algorithm = Algorithm.new('Hello World', '12345', '27/08/20')

      expect(algorithm).is_a? Algorithm 
    end

    xit 'has default attributes' do
      allow(Date).to receive(:today).and_return(Date.new(2020, 8, 27))
      algorithm = Algorithm.new('Hello World')
 
      expect(algorithm.message).to eq 'Hello World'
      expect(algorithm.enigma_key).to eq ''
      expect(algorithm.date).to eq '27/08/20'
    end

    it 'has attributes' do
      algorithm = Algorithm.new('Hello World', '12345', '01/01/20')

      expect(algorithm.message).to eq 'Hello World'
      expect(algorithm.enigma_key).to eq '12345'
      expect(algorithm.date).to eq '01/01/20'
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