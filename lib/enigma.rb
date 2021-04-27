require './lib/algorithm'

class Enigma
  def encrypt(message, enigma_key = '', date = Date.today.strftime('%d/%m/%y'))
    enigma_key = random_key if enigma_key == ''
    ciphertext = Algorithm.shift(message, enigma_key, date, 'encrypt')
    encrpyted = {
      :encryption => ciphertext,
      :key        => enigma_key,
      :date       => date.gsub('/', '')
    }
  end

  def decrypt(ciphertext, enigma_key = '', date = Date.today.strftime('%d/%m/%y'))
    enigma_key = random_key if enigma_key == ''
    original_message = Algorithm.shift(ciphertext, enigma_key, date, 'decrypt')
    decrpyted = {
      :decryption => original_message,
      :key        => enigma_key,
      :date       => date.gsub('/','')
    }
  end

  def random_key
    (0..9).to_a.sample(5).join
  end
end