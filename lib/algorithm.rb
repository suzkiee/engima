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
end