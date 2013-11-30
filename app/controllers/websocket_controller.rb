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
  	message[:events].each do |event|
  		puts event
			broadcast_message :command, event
			sleep 1
		end
  end

end
