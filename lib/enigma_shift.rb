class EnigmaShift
  attr_reader :enigma_key,
              :date,
              :shifts

  def initialize(enigma_key = '')
    @enigma_key = enigma_key
    @date = Date.today.strftime('%d/%m/%y')
    @shifts = []
  end

  def generate_random_key_number
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    new_key = numbers.sample(5)
    new_key.join 
  end

  def generate_enigma_keys(enigma_key = '')
    if enigma_key == ''
      @enigma_key = generate_random_key_number   
    end
    pairs = convert_to_pairs(@enigma_key)
    enigma_keys = {
                   :A => nil,
                   :B => nil,
                   :C => nil,
                   :D => nil
    }
    i = 0
    enigma_keys.each do |key, value|
      enigma_keys[key] = pairs[i].to_i
      i += 1
    end
    enigma_keys
  end

  def convert_to_pairs(enigma_key)
    (0...enigma_key.length - 1).map do |index|
        enigma_key[index..index + 1]
    end
  end
end

