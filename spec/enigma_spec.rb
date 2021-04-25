require 'rspec'
require './lib/enigma'
require './lib/algorithm'

describe Enigma do
  describe '#instantiation' do
    it 'exists' do
      enigma = Enigma.new('Hello World')
      
      expect(enigma).is_a? Enigma
    end
    
    it 'has attributes' do
      allow(Date).to receive(:today).and_return(Date.new(2020, 8, 27))
      enigma = Enigma.new('Hello World')

      expect(enigma.message).to eq 'Hello World'
      expect(enigma.enigma_key).to eq ''
      expect(enigma.date).to eq '27/08/20'
    end
  end
end