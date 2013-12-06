class WebsocketController < WebsocketRails::BaseController

	def initialize_session
    # perform application setup here
    controller_store[:client_count] = 0
  end

  def client_connected
  	puts "client connected"
    controller_store[:client_count] = controller_store[:client_count] + 1
  end

  def client_disconnected
    puts "client disconnected"
    controller_store[:client_count] = controller_store[:client_count] - 1

    if controller_store[:client_count] == 0
      @ssh_test = Net::SSH.start(ENV["CLIENT_SSH_ADDRESS"],ENV["CLIENT_SSH_USER"], :password => ENV["CLIENT_SSH_PASSWORD"] ) do |ssh|
      result = ssh.exec!('forever restart lights-mochad.js')
    end
  end

  def command
  	puts message
  	broadcast_message :command, message
  end

  def command_collection
  	puts message
  	broadcast_message :command_collection, message
  end

end
