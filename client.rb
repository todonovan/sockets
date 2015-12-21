require 'socket'

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)

puts "Verb for request?"
verb = gets.chomp.upcase until ["GET", "POST"].include? verb
puts "Resource to request?"
path = gets.chomp

request = "#{verb} #{path}"

s.write(request)
while line = s.gets
  puts line.chop
end
s.close

