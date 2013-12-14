class WebsocketController < WebsocketRails::BaseController

	def initialize_session
    # perform application setup here
    controller_store[:current_state] = ""
  end

  def client_connected
  	puts "client connected"
  end

  def client_disconnected
    puts "client disconnected"
  end

  def command
  	puts message
    maybe_save_state message
  	broadcast_message :command, message
  end

  def command_collection
    # TODO: Pickup current state from presets
  	puts message
  	broadcast_message :command_collection, message
  end

  def current_state
    puts controller_store[:current_state]
    broadcast_message :current_state, controller_store[:current_state]
  end

  def schedule_updated
    puts "sending scheduled events for zone " + message[:zone]
    broadcast_message :schedule_updated, {:zone => message[:zone], :events => Event.where(:zone => message[:zone])}
  end

  def maybe_save_state(message=nil)
    if message
      if message[:event] != 9
        puts "saving current state"
        controller_store[:current_state] = message
      end
    end
  end
end
