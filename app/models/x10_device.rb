class X10Device < ActiveRecord::Base
	attr_accessible :name, :deviceId, :houseCode, :deviceType, :zone, :room_id
	belongs_to :room
	belongs_to :zone
end