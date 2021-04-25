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

  # def shift_forward(message, enigma_key, date)
  #   enigma_shift = EnigmaShift.new(enigma_key, date)
  #   enigma_shift.create_shifts(enigma_key, date)
  #   shifts = enigma_shift.shifts
  #   encrypted_string = ''
  #   message = message.downcase
  #   require 'pry'; binding.pry

  #   message.each_char do |char|
  #     require 'pry'; binding.pry
  #     if @character_set.include?(char) 
  #         # shift.times do |char|
  #         # char.next
  #         require 'pry'; binding.pry
  #     end
  #   end
    # starting at the input of the character, rotate across the character set
    ## if the character is not included in set, return same character
    # return array of adjusted letters
    # join array into string 
  # end

  def shift_forward(message, enigma_key, date)
    enigma_shift = EnigmaShift.new(enigma_key, date)
    enigma_shift.create_shifts(enigma_key, date)
    shifts = enigma_shift.shifts
    encrypted_string = ''
    message = message.downcase

    message.each_char.with_index do |char, index|
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
end