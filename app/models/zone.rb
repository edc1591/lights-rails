class Zone < ActiveRecord::Base
	attr_accessible :name, :has_colors
	has_many :x10_devices
	has_and_belongs_to_many :users
end
