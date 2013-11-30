class X10device < ActiveRecord::Base
	attr_accessible :name, :deviceId, :houseCode, :deviceType, :zone
	has_one :name
	has_one :deviceId
	has_one :houseCode
	has_one :deviceType
	has_one :zone
end