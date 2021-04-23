class EnigmaKey
  attr_reader :key_number,
              :date,
              :shifts

  def initialize(key_number = 00000)
    @key_number = key_number
    @date = Date.today.strftime('%m/%d/%y')
    @shifts = []
  end

  def generate_random_key_number
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    new_key = numbers.sample(5)
    @key_number = new_key.join.to_i
  end
end