class WebsocketController < WebsocketRails::BaseController

	def initialize_session
    # perform application setup here
    # controller_store[:message_count] = 0
  end

  def client_connected
  	
  end

  def command
  	puts message
  	broadcast_message :command, message
  end

  def command_collection
  	message[:events].each do |i|
			puts i
		end
  end

end
