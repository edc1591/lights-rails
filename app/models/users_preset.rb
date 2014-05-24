class UsersPreset < ActiveRecord::Base
	attr_accessible :preset_id, :user_id
	belongs_to :user
	belongs_to :preset
end
