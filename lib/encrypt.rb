require 'date'
require './lib/enigma'

enigma = Enigma.new
message = File.read(ARGV[0])
encrypt = enigma.encrypt(message)
File.write(ARGV[1], encrypt[:encryption])
puts "Created '#{ARGV[1]}' with key #{encrypt[:key]} and date #{encrypt[:date]}"