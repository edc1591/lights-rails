class StoreDeviceTokensInArray < ActiveRecord::Migration
  def change
  	remove_column :users, :device_token
  	add_column :users, :device_tokens, :text
  end
end
