class Room < ActiveRecord::Base
	attr_accessible :name, :has_colors
	has_many :x10_devices
	belongs_to :beacon
end
