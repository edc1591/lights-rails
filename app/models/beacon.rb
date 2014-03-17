class Beacon < ActiveRecord::Base
	attr_accessible :major, :minor, :name, :room_id
	belongs_to :room
end
