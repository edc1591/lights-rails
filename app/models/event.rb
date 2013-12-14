class Event < ActiveRecord::Base
	attr_accessible :name, :deviceId, :repeat, :eventId, :zone, :time, :timeZone, :state, :speed, :brightness, :command
	serialize :repeat


end
