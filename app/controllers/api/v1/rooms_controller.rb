class Api::V1::RoomsController < Api::V1::ApiController
	before_filter :api_session_token_authenticate!

	def show
		if params[:id]
			room = Room.find_by_id(params[:id])
			render :json => room.to_json(include: :x10_devices), :code => :ok
		else
			render :json => Room.all(include: :x10_devices).to_json(include: :x10_devices)
		end
	end

	def command
		room = Room.find_by_id(params[:id])
		object = Hash.new
		object[:events] = Array.new
		zones = Set.new
		room.x10_devices.each do |device|
			zones.add device.zone_id
			d = {:command => params[:command], :zone_id => device.zone_id, :device => device.deviceId, :houseCode => device.houseCode, :eventType => 9}
			object[:events].push d
		end
		if room.has_colors
			if params[:command] == "0"
				d = {:color => [0,0,0], :eventType => 1, :zone_id => 1}
				object[:events].push d
			elsif params[:command] == "1"
				d = {:brightness => 255, :speed => 200, :eventType => 2, :zone_id => 1}
				object[:events].push d
			end
		end
		zones.each do |zone|
			WebsocketRails.users[zone].send_message :command_collection, object
		end
		render :nothing => true
	end

end
