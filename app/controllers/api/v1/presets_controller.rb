class Api::V1::PresetsController < Api::V1::ApiController
	before_filter :api_session_token_authenticate!

	def create
		@preset = Preset.new(params[:preset])
		@preset.owner = current_user.id

		if @preset.save
			render :json => @preset, :code => :ok
		else
			render :json => {}, :code => :unprocessable_entity
		end
	end

	def show
		render :json => Preset.all
	end

	def update
		if Preset.update(params[:id], params[:preset])
    	render :json => Preset.find_by_id(params[:id]), :status => :ok
    else
    	render :json => {}, :code => :unprocessable_entity
		end
	end
end
