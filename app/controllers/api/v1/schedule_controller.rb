class Api::V1::ScheduleController < Api::V1::ApiController
	before_filter :api_session_token_authenticate!

	def show
		render :json => {:events => ScheduledEvent.all}
	end

	def create
		@event = ScheduledEvent.new(params[:schedule])

		if @event.save
			render :json => @event, :code => :ok
		else
			render :json => {}, :code => :unprocessable_entity
		end
	end

	def update
		if ScheduledEvent.update(params[:id], params[:schedule])
    	render :json => ScheduledEvent.find_by_id(params[:id]), :status => :ok
    else
    	render :json => {}, :code => :unprocessable_entity
		end
	end

	def show_for_zone
		zone = params[:zone]
		events = ScheduledEvent.where("time IS NOT NULL AND zone = #{zone}")
		render :json => {:events => events}, :status => :ok
	end
end
