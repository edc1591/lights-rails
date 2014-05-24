require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates_presence_of   :username,      on: :create
  validates_uniqueness_of :username,      on: :create
  #validates_presence_of   :password,      on: :create
  has_many :users_preset
  has_many :presets, through: :users_preset
  has_many :rooms_users
  has_many :rooms, through: :rooms_users
  serialize :device_tokens
  attr_accessible :device_tokens

  def password=(secret)
    write_attribute(:password, BCrypt::Password.create(secret))
  end

  def has_colors
  	rooms.each do |room|
  		return true unless room.has_colors == false
  	end
  	return false
  end
end
