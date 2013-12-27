class RemoveZoneFromX10 < ActiveRecord::Migration
  def change
  	remove_column :x10_devices, :zone
  end
end
