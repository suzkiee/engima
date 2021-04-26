require './lib/enigma_shift'

class Algorithm
  attr_reader :message,
              :enigma_key,
              :date,
              :character_set

  def initialize(message, enigma_key = '', date = Date.today.strftime('%d/%m/%y'))
    @message = message
    @enigma_key = enigma_key
    @date = date 
    @character_set = ('a'..'z').to_a << ' '
  end

  def shift_forward(message, enigma_key, date)
    ## maybe module?
    enigma_shift = EnigmaShift.new(enigma_key, date)
    enigma_shift.create_shifts(enigma_key, date)
    shifts = enigma_shift.shifts
    encrypted_string = ''
    downcased_string = message.downcase

    downcased_string.each_char.with_index do |char, index|
      if @character_set.include?(char)
        shifted_char_index = shifts[index % 4]
        new_index = (@character_set.index(char) + shifted_char_index) % character_set.length
        encrypted_string << character_set[new_index]
      else 
        encrypted_string << char
      end
    end
    encrypted_string
  end

  def shift_backward(encrypted_string, enigma_key, date)
    enigma_shift = EnigmaShift.new(enigma_key, date)
    enigma_shift.create_shifts(enigma_key, date)
    shifts = enigma_shift.shifts
    original_message = ''
    
    encrypted_string.each_char.with_index do |char, index|
      if character_set.include?(char)
        shifted_char_index = shifts[index % 4]
        new_index= (@character_set.index(char) - shifted_char_index) % character_set.length
        original_message << @character_set[new_index]
      else
        original_message << char
      end
    end
    original_message
  end
end