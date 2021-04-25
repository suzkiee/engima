class Enigma
  attr_reader :message, 
              :enigma_key,
              :date

  def initialize(message, enigma_key = '', date = Date.today.strftime('%d/%m/%y'))
    @message = message 
    @enigma_key = enigma_key 
    @date = date 
  end

  def encrypt(message, enigma_key = '', date = Date.today.strftime('%d/%m/%y'))
    algorithm = Algorithm.new(message, enigma_key, date) 
    ciphertext = algorithm.shift_forward(message, enigma_key, date) #class method?
    encrpyted = {
      :encryption => ciphertext,
      :key        => enigma_key,
      :date       => date
    }
  end

  def decrypt(ciphertext, enigma_key = '', date = Date.today.strftime('%d/%m/%y'))
    algorithm = Algorithm.new(ciphertext, enigma_key, date) 
    original_message = algorithm.shift_backward(ciphertext, enigma_key, date) #class method?
    decrpyted = {
      :decryption => original_message,
      :key        => enigma_key,
      :date       => date
    }
  end
end