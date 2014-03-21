class Api::V1::UsersController < Api::V1::ApiController
	skip_before_filter :api_session_token_authenticate!, only: [:has_password, :set_password]

	def devices
		render :json => current_user.rooms(include: :x10_devices).to_json(include: :x10_devices), :status => :ok
	end

	def register_device_token
		current_user.device_tokens.push params[:device_token]
		current_user.save
		render :nothing => true
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