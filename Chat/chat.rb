require 'socket'
require './member'
require './members'

server = TCPServer.new(2000)

puts 'Server running in port 2000...'

members = Members.new

while true
  tcp_socket = server.accept
  Thread.new(tcp_socket) do |socket|
    member = members.register(socket)
    begin
      members.start_listening_to(member)
    rescue EOFError
      members.disconnect(member)
    end
  end
end
