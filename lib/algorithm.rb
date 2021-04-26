require './lib/enigma_shift'

class Algorithm

  def self.shift_forward(message, enigma_key, date)
    enigma_shift = EnigmaShift.new
    enigma_shift.create_shifts(enigma_key, date)
    shifts = enigma_shift.shifts
    character_set = ('a'..'z').to_a << ' '
    encrypted_string = ''
    downcased_string = message.downcase

    downcased_string.each_char.with_index do |char, index|
      if character_set.include?(char)
        shifted_char_index = shifts[index % 4]
        new_index = (character_set.index(char) + shifted_char_index) % character_set.length
        encrypted_string << character_set[new_index]
      else 
        encrypted_string << char
      end
    end
    encrypted_string
  end

  def self.shift_backward(encrypted_string, enigma_key, date)
    enigma_shift = EnigmaShift.new
    enigma_shift.create_shifts(enigma_key, date)
    shifts = enigma_shift.shifts
    character_set = ('a'..'z').to_a << ' '
    original_message = ''
    
    encrypted_string.each_char.with_index do |char, index|
      if character_set.include?(char)
        shifted_char_index = shifts[index % 4]
        new_index= (character_set.index(char) - shifted_char_index) % character_set.length
        original_message << character_set[new_index]
      else
        original_message << char
      end
    end
    original_message
  end
end