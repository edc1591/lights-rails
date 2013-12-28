class Preset < ActiveRecord::Base
	attr_accessible :name, :owner, :events_raw
	serialize :events

	def events_raw
    self.events.join("\n") unless self.events.nil?
  end

  def events_raw=(values)
    self.events = []
    self.events=values.split("\n")
  end
end
