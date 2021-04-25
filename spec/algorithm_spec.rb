require 'rspec'
require './lib/algorithm'
require './lib/enigma_shift'

describe Algorithm do
  describe '#inistantian' do
    it 'exists' do
      algorithm = Algorithm.new('Hello World', '12345', '27/08/20')

      expect(algorithm).is_a? Algorithm 
    end

    it 'has deafult attributes' do
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

  describe '#create_character_set' do
    it 'creates character set' do
      algorithm = Algorithm.new('Hello World')
      expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", 
                  "j", "k", "l", "m", "n", "o", "p", "q", "r", 
                  "s", "t", "u", "v", "w", "x", "y", "z", " "]
                  
      expect(algorithm.create_character_set).to eq expected 
    end
  end
end