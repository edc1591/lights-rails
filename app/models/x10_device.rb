class X10Device < ActiveRecord::Base
	attr_accessible :name, :deviceId, :houseCode, :deviceType, :zone
	belongs_to :room
end