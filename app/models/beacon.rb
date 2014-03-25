class Beacon < ActiveRecord::Base
	attr_accessible :major, :minor, :name, :room_id, :latitude, :longitude
	belongs_to :room
end
