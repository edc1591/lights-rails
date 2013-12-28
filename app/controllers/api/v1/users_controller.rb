class Api::V1::UsersController < Api::V1::ApiController
	skip_before_filter :api_session_token_authenticate!, only: [:has_password, :set_password]

	def devices
		retVal = Array.new
		current_user.zones do |zone|
			retVal.push(zone.x10_devices)
		end
		render :json => retVal, :status => :ok
	end

	def has_colors
		has_colors = false
		current_user.zones do |zone|
			if zone.has_colors
				has_colors = true
			end
		end
		render :json => {:has_colors => has_colors}, :status => :ok
	end

	def has_password
		user = User.where(:username => params[:username]).first
		if user.password.blank?
			render :json => {:has_password => false}
		else
			render :json => {:has_password => true}
		end
	end

	def set_password
		user = User.where(:username => params[:username]).first
		user.password = params[:password]
		if user.save
			render :json => {}
		else
			render :json => {}
		end
	end
end