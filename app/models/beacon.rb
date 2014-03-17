class Beacon < ActiveRecord::Base
	attr_accessible :major, :minor, :name, :entry_event, :exit_event
	serialize :entry_event, Hash
	serialize :exit_event, Hash
end
