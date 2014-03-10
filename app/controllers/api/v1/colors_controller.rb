class Api::V1::ColorsController < Api::V1::ApiController
	before_filter :api_session_token_authenticate!

	def animations
		render :json => {:animations => Animation.all}
	end

	def animation
		zone = color_zone
		if zone != nil
			message = {:zone_id => zone, :eventType => Animation.find_by_id(params[:id]).animationId, :speed => params[:speed], :brightness => params[:brightness]}
			WebsocketRails.users[zone].send_message :command, message

			render :nothing => true
		else
			render :nothing => true, :status => 401
		end
	end

	def solid
		zone = color_zone
		if zone != nil
			message = {:zone_id => zone, :eventType => 1, :color => params[:color]}
			WebsocketRails.users[zone].send_message :command, message

			render :nothing => true
		else
			render :nothing => true, :status => 401
		end
	end

	private
	def color_zone
		Zone.all.each do |z|
			if z.has_colors
				return z.id
			end
		end
		return nil
	end

end
