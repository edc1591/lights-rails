class Api::V1::UsersController < Api::V1::ApiController
	skip_before_filter :api_session_token_authenticate!, only: [:has_password, :set_password]

	def allowed_devices
		retVal = Array.new
		current_user.devices.each do |i|
			retVal.push X10device.find_by_id(i)
		end
		render :json => {:devices => retVal}
	end

	def has_password
		user = User.where(:username => params[:username]).first
		if user.password
			render :json => {:has_password => true}
		else
			render :json => {:has_password => false}
		end
	end

	def set_password
		user = User.where(:username => params[:username]).first
		user.password = params[:password]
		user.save
	end
end