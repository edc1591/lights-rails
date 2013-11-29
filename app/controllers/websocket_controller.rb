class WebsocketController < WebsocketRails::BaseController

	def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def client_connected
  	
  end

  def x10_command
  	puts 'hi'
  end

end
