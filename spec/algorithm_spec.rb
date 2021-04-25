require 'rspec'
require './lib/algorithm'
require './lib/enigma_shift'

describe Algorithm do
  describe '#inistantian' do
    it 'exists' do
      algorithm = Algorithm.new('Hello World', '12345', '27/08/20')

      expect(algorithm).is_a? Algorithm 
    end

    it 'has attributes' do
      algorithm = Algorithm.new('Hello World', '12345', '27/08/20')

      expect(algorithm.message).to eq 'Hello World'
      expect(algorithm.enigma_key).to eq '12345'
      expect(algorithm.date).to eq '27/08/20'
    end
  end
end