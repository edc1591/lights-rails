class ScheduledEvent < ActiveRecord::Base
	attr_accessible :name, :repeat, :time, :timeZone, :state, :event
	serialize :repeat, Array
	serialize :event, Hash
	belongs_to :zone

end
