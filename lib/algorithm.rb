require './lib/algorithm_helper'

class Algorithm
  def self.shift(input, key, date, crypt)
    algorithm_helper = AlgorithmHelper.new
    algorithm_helper.create_shifts(key, date)
    shifts = algorithm_helper.shifts
    character_set = ('a'..'z').to_a << ' '
    output = ''

    input.downcase.each_char.with_index do |char, index|
      if character_set.include?(char)
        shifted_char_index = shifts[index % 4]
        if crypt == 'decrypt'
          new_index = (character_set.index(char) - shifted_char_index) % character_set.length
        elsif crypt == 'encrypt'
          new_index = (character_set.index(char) + shifted_char_index) % character_set.length
        end 
        output << character_set[new_index]
      else
        output << char
      end
    end
    output
  end 
end