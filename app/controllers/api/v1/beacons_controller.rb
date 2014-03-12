class Api::V1::BeaconsController < Api::V1::ApiController
	before_filter :api_session_token_authenticate!

	def show
		render :json => {:beacons => Beacon.all}
	end
end
