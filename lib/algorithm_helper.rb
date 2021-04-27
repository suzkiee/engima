class AlgorithmHelper
  attr_reader :shifts

  def initialize
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
    enigma_keys = create_letter_hash
    assign_to_letter(enigma_keys, pairs)
    enigma_keys
  end

  def generate_offsets(date)
    last_four = convert_date(date)
    enigma_offsets = create_letter_hash 
    assign_to_letter(enigma_offsets, last_four)
    enigma_offsets 
  end

  def assign_to_letter(letter_hash, digits)
    i = 0
    letter_hash.each_with_index do |(letter, value), i|
      letter_hash[letter] = digits[i].to_i
      i += 1
    end
  end

  def create_letter_hash
    hash = Hash.new
    ('A'..'D').each do |letter| 
      hash[letter.to_sym] = nil
    end 
    hash
  end

  def convert_to_pairs(enigma_key)
    (0...enigma_key.length - 1).map do |index|
      enigma_key[index..index + 1]
    end
  end

  def convert_date(date)
    number = date.split('/').join.to_i
    (number ** 2).to_s[-4..-1]
  end
end

