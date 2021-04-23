require 'rspec'
require 'date'
require './lib/enigma_shift'

describe EnigmaShift do
  describe '#instantiation' do
    it 'exists' do
      enigma_shift = EnigmaShift.new

      expect(enigma_shift).is_a? EnigmaShift
    end

    it 'has attributes' do
      allow(Date).to receive(:today).and_return(Date.new(2020, 8, 27))
      enigma_shift = EnigmaShift.new

      expect(enigma_shift.date).to eq ('08/27/20')
      expect(enigma_shift.shifts).to eq ([])
    end
  end

  # Rethink how to test this
  # describe '#generate_random_key' do
  #   it 'generates random 5 digit key number' do
  #     enigma_shift = EnigmaShift.new
     
  #     enigma_shift.generate_random_key
  #     expect(enigma_shift.key_number).to eq 12345 
  #   end
  # end
  describe '#generate_enigma_shift' do
    it 'generates key' do
      
      expect(enigma_shift.generate_key).to eq expected 
    end
  end

  describe '#generate_offset' do
    it 'generates offset from date' do
      enigma_shift = EnigmaShift
      
      expected = [ { :A :  },
                   { :B :  },
                   { :C :  },
                   { :D :  }
                  ]
      expect(enigma_shift.generate_offset).to eq expected
    end 
  end
end 
