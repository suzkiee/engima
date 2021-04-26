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

      expect(Algorithm.shift('Hello World', '02715', '040895', 'encrypt')).to eq 'keder ohulw'
    end

    it 'encyrpts character as itself if character not in chracter set' do

      expect(Algorithm.shift('Hello World!', '02715', '040895', 'encrypt')).to eq 'keder ohulw!'
    end
    
    it 'shifts letters backward' do

      expect(Algorithm.shift('keder ohulw', '02715', '040895', 'decrypt')).to eq 'hello world'
    end
    
    it 'decrypts character as itself if character not in chracter set' do

     expect(Algorithm.shift('keder ohulw!', '02715', '040895', 'decrypt')).to eq 'hello world!'
    end
  end
end