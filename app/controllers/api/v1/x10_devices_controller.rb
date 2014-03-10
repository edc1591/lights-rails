class Api::V1::X10DevicesController < Api::V1::ApiController

	def command
		device = X10Device.find_by_id(params[:id])
		message = {:command => params[:command], :zone_id => device.zone_id, :device => device.deviceId, :houseCode => device.houseCode, :eventType => 9}
		WebsocketRails.users[device.zone_id].send_message :command, message

		render :nothing => true
	end

end
