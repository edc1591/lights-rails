class AddRoomToBeacon < ActiveRecord::Migration
  def change
  	add_column :beacons, :room_id, :integer
  end
end
