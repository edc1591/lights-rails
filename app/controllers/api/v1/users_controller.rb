class Api::V1::UsersController < Api::V1::ApiController

	def allowed_devices
		retVal = Array.new
		current_user.devices.each do |i|
			retVal.push X10device.find_by_id(i)
		end
		render :json => {:devices => retVal}
	end
end