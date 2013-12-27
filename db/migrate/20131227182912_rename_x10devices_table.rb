class RenameX10devicesTable < ActiveRecord::Migration
  def change
  	rename_table :x10devices, :x10_devices
  end
end
