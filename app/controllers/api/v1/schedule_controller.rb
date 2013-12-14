class Api::V1::ScheduleController < Api::V1::ApiController
	before_filter :api_session_token_authenticate!

	def show
		render :json => {:animations => Event.all}
	end

	def create
		@event = Event.new(params[:event])

		if @event.save
			render :json => @event, :code => :ok
		else
			render :json => {}, :code => :unprocessable_entity
		end
	end

	def update
		@event = Event.find_by_id(params[:id])

		if @event
			@event.safe_update(@event, params[:event]) if params[:event]
    	render :json => @event, :status => :ok
    else
    	render :json => {}, :code => :unprocessable_entity
		end
	end

	def show_for_zone
		events = Event.where(:zone => params[:zone])
		render :json => events, :status => :ok
	end
end
