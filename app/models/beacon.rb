class Beacon < ActiveRecord::Base
	attr_accessible :major, :minor, :name
	has_one :room
end
