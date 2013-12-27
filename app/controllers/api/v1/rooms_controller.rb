class Api::V1::RoomsController < Api::V1::ApiController
	before_filter :api_session_token_authenticate!

	def show
		if params[:id]
			room = Room.find_by_id(params[:id])
			render :json => room.to_json(include: :x10_devices), :code => :ok
		else
			retVal = Array.new
			Room.all.each do |obj|
				retVal.push obj.to_json(include: :x10_devices)
			end
			render :json => {:rooms => retVal}, :code => :ok
		end
	end

end
