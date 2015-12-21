require 'socket'
require 'json'

server = TCPServer.open(2000)
http_verbs = ["GET", "POST", "HEAD", "PUT", "DELETE"]


loop do
  client = server.accept
  request = client.gets
  client.puts "Request was #{request}"
  verb = request.split(' ')[0]
  if !(http_verbs.include?(verb))
    client.puts "HTTP/1.0 400 Bad Request"
    client.puts "Closing the connection. Bye!"
    client.close
  elsif verb == "GET"
    path = request.split(' ')[1]
    if path == "index.html"
      file = File.new("index.html", "r")
      file_content = file.read
      response1 = "HTTP/1.0 200 OK"
      response2 = Time.now.ctime
      response3 = "Content-Type: text/html"
      response4 = "Content-Length: #{file.size}"
      client.puts response1
      client.puts response2
      client.puts response3
      client.puts response4
      client.print file_content
    else
      client.puts "HTTP/1.0 404 Not Found"
    end
  end
  client.puts "Closing the connection. Bye!"
  client.close
end