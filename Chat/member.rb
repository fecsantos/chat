class Member

  attr_reader :username, :socket

  def initialize(username, socket)
    @username = username
    @socket = socket
  end

  def welcome_from(members)
    socket.print "Welcome, #{username}! There are #{members.count} people here!"
    new_line_prompt
  end

  def prompt
    socket.print(">: ")
  end

  def new_line_prompt
    socket.print("\n>: ")
  end

  def listen
    socket.readline.chomp
  end

  def disconnect
    socket.close
  end
end
