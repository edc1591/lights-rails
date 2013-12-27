class Preset < ActiveRecord::Base
	attr_accessible :name, :owner, :events
	serialize :events
end
