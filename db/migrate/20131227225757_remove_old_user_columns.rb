class RemoveOldUserColumns < ActiveRecord::Migration
  def change
  	remove_column :users, :devices
  	remove_column :users, :color_zones
  end
end
