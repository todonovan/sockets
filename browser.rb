require 'socket'
require 'json'

host = 'localhost'
port = 2000
path = "index.html"

puts "Verb for request?"
verb = gets.chomp.upcase until ["GET", "POST"].include? verb
  if verb == "POST"
    puts "Info about your viking raid: "
    puts "name?"
    name = gets.chomp
    puts "email?"
    email = gets.chomp
    options_hash = {:viking => {:name => name, :email => email }}

puts "Resource to request?"
path = gets.chomp

request = "#{verb} #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host, port)
socket.print(request)
response = socket.read
puts response