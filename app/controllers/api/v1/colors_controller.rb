class Api::V1::ColorsController < Api::V1::ApiController
	before_filter :api_session_token_authenticate!

	def animations
		render :json => {:animations => Animation.all}
	end
end
