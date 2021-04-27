require './lib/algorithm_helper'

class Algorithm
  def shift(input, key, date, crypt)
    shifts = create_shifts(key, date)
    translate_input(input, shifts, crypt)
  end

  def translate_input(input, shifts, crypt)
    output = ''
    downcased = input.downcase
    downcased.each_char.with_index do |char, index|
      if character_set.include?(char)
        shifted_index = shifts[index % 4]
        if crypt == 'decrypt'
          new_index = (character_set.index(char) - shifted_index) % character_set.length
        elsif crypt == 'encrypt'
          new_index = (character_set.index(char) + shifted_index) % character_set.length
        end
        output << character_set[new_index]
      else
        output << char
      end
    end
    output
  end

  def create_shifts(key, date)
    helper = AlgorithmHelper.new
    helper.create_shifts(key, date)
    helper.shifts
  end

  def character_set
    ('a'..'z').to_a << ' '
  end
end