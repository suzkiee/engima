class Algorithm
  attr_reader :message,
              :enigma_key,
              :date

  def initialize(message, enigma_key = '', date = Date.today.strftime('%d/%m/%y'))
    @message = message 
    @enigma_key = enigma_key
    @date = date 
  end

  def create_character_set 
    ("a".."z").to_a << " "
  end

  def shift_forward(message, enigma_key, date)
    enigma_shift = EnigmaShift.new(enigma_key, date)
    shifts = enigma_shift.create_shifts(enigma_key, date)
    require 'pry'; binding.pry
    
    # To each character of the method 
    # assign the corresponding shift to relative index 
    
    character_set = create_character_set 
    # starting at the input of the character, rotate across the character set
    ## if the character is not included in set, return same character
    # return array of adjusted letters
    # join array into string 
  end
end