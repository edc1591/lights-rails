class RoomsUser < ActiveRecord::Base
	attr_accessible :user_id, :room_id
	belongs_to :user
	belongs_to :room
end
