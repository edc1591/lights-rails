class Api::V1::ScheduleController < Api::V1::ApiController
	before_filter :api_session_token_authenticate!

	def show
		render :json => {:animations => Animation.all}
	end

	
end
