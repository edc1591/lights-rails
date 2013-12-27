class Api::V1::RoomsController < Api::V1::ApiController
	before_filter :api_session_token_authenticate!

	def show
		if params[:id]
			room = Room.find_by_id(params[:id])
			render :json => room, :code => :ok
		else
			render :json => {:rooms => Room.all}
		end
	end
	
end
