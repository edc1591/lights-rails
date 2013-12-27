class Api::V1::RoomsController < Api::V1::ApiController
	before_filter :api_session_token_authenticate!

	def show
		if params[:id]
			room = Room.find_by_id(params[:id])
			render :json => room.to_json(include: :x10_devices), :code => :ok
		else
			render :json => {:rooms => Room.all.as_json.to_json(include: :x10_devices)}
		end
	end

end
