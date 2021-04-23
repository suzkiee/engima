class Key
  attr_reader :key,
              :date,
              :shifts

  def initialize(key = 00000)
    @key = key
    @date = Date.today.strftime('%m/%d/%y')
    @shifts = []
  end

  def generate_random_key
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    new_key = numbers.sample(5)
    @key = new_key.join.to_i
    require 'pry'; binding.pry
  end
end