class Room < ActiveRecord::Base
	attr_accessible :name
	has_many :x10_devices
end
