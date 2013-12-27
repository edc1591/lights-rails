class Zone < ActiveRecord::Base
	attr_accessible :name, :has_colors
	has_many :x10_devices
	has_many :zones_users
  has_many :users, through: :zones_users
end
