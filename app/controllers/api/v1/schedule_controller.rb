class Api::V1::ScheduleController < Api::V1::ApiController
	before_filter :api_session_token_authenticate!

	def show
		render :json => {:events => Event.all}
	end

	def create
		@event = Event.new(params[:schedule])

		if @event.save
			render :json => @event, :code => :ok
		else
			render :json => {}, :code => :unprocessable_entity
		end
	end

	def update
		if Event.update(params[:id], params[:schedule])
    	render :json => Event.find_by_id(params[:id]), :status => :ok
    else
    	render :json => {}, :code => :unprocessable_entity
		end
	end

	def show_for_zone
		events = Event.where(:zone => params[:zone])
		render :json => {:events => events}, :status => :ok
	end
end
