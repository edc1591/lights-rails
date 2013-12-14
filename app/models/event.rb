class Event < ActiveRecord::Base
	attr_accessible :name, :deviceId, :repeat, :eventType, :zone, :time, :timeZone, :state, :speed, :brightness, :command, :color
	serialize :repeat
	serialize :color


end
