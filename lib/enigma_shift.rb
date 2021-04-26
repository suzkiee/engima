class EnigmaShift
  attr_reader :enigma_key,
              :date,
              :shifts

  def initialize(enigma_key = '', date = Date.today.strftime('%d/%m/%y'))
    @enigma_key = enigma_key
    @date = date
    @shifts = []
  end

  def create_shifts(enigma_key, date)
    enigma_keys = generate_enigma_keys(enigma_key)
    offsets = generate_offsets(date)
    combined = enigma_keys.merge(offsets) { |letter, key, offset|  key + offset } 
    combined.each { |key, value| @shifts << value }
  end

  def generate_enigma_keys(enigma_key)
    pairs = convert_to_pairs(enigma_key)
    enigma_keys = { :A => nil, :B => nil, :C => nil, :D => nil }
    i = 0
    enigma_keys.each do |key, value|
      enigma_keys[key] = pairs[i].to_i
      i += 1
    end
    enigma_keys
  end

  def self.generate_random_key_number
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    new_key = numbers.sample(5)
    new_key.join 
  end

  def convert_to_pairs(enigma_key)
    (0...enigma_key.length - 1).map do |index|
        enigma_key[index..index + 1]
    end
  end

  def generate_offsets(date)
    last_four = convert_date(date)
    enigma_offsets = { :A => nil, :B => nil, :C => nil, :D => nil }
    i = 0
    enigma_offsets.each do |key, value|
      enigma_offsets[key] = last_four[i].to_i
      i += 1
    end
    enigma_offsets 
  end

  def convert_date(date)
    number = date.split('/').join.to_i
    (number ** 2).to_s[-4..-1]
  end
end

