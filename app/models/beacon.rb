class Beacon < ActiveRecord::Base
	attr_accessible :major, :minor, :name
	belongs_to :room
end
