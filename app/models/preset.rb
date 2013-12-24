class Preset < ActiveRecord::Base
	attr_accessible :name, :owner
	has_many :events
end
