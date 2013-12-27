class ZonesUsers < ActiveRecord::Base
	attr_accessible :user_id, :zone_id
	belongs_to :user
	belongs_to :zone
end
