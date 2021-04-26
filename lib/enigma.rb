require './lib/algorithm'

class Enigma
  # attr_reader :message, 
  #             :enigma_key,
  #             :date

  # def initialize
  #   @message = message
  # end

  def encrypt(message, enigma_key = '', date = Date.today.strftime('%d/%m/%y'))
    enigma_key = EnigmaShift.random_key if enigma_key == ''
    ciphertext = Algorithm.shift_forward(message, enigma_key, date) #class method?

    encrpyted = {
      :encryption => ciphertext,
      :key        => enigma_key,
      :date       => date.gsub('/', '')
    }
  end

  def decrypt(ciphertext, enigma_key = '', date = Date.today.strftime('%d/%m/%y'))
    enigma_key = EnigmaShift.random_key if enigma_key == ''
    original_message = Algorithm.shift_backward(ciphertext, enigma_key, date) #class method?
    decrpyted = {
      :decryption => original_message,
      :key        => enigma_key,
      :date       => date.gsub('/','')
    }
  end
end