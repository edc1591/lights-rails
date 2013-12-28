class Preset < ActiveRecord::Base
	attr_accessible :name, :events, :user_id
	belongs_to :user
	serialize :events

	def events_raw
    events.join("\n") unless self.events.nil?
  end

  def events_raw=(values)
    events = []
    events = values.split("\n")
  end
end
