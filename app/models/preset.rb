class Preset < ActiveRecord::Base
	attr_accessible :name, :events, :user_id, :events_raw
	belongs_to :user
	serialize :events, JSON
  has_many :users_preset
  has_many :users, through: :users_preset

	def events_raw
    read_attribute(:events).to_json
  end

  def events_raw=(values)
  	json = JSON.parse values unless values.nil?
    write_attribute(:events, json)
  end
end
