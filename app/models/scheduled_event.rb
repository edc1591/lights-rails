class ScheduledEvent < ActiveRecord::Base
	attr_accessible :name, :deviceId, :repeat, :eventType, :zone_id, :time, :timeZone, :state, :speed, :brightness, :command, :color
	serialize :repeat
	serialize :color
	belongs_to :zone

end
