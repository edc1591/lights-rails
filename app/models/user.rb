class User < ActiveRecord::Base
	validates_presence_of   :username,      on: :create
  validates_uniqueness_of :username,      on: :create
  validates_presence_of   :email_address, on: :create
  validates_uniqueness_of :email_address, on: :create
  validates_presence_of   :password,      on: :create

  def password=(secret)
    write_attribute(:password, BCrypt::Password.create(secret))
  end
end
