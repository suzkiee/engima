require './lib/enigma'

enigma = Enigma.new
message = File.read(ARGV[0])
decrypt = enigma.decrypt(message, ARGV[2], ARGV[3])
File.write(ARGV[1], decrypt[:decryption])
puts "Created '#{ARGV[1]}' with the key #{decrypt[:key]} and date #{decrypt[:date]}"