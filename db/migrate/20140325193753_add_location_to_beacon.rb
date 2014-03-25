class AddLocationToBeacon < ActiveRecord::Migration
  def change
  	add_column :beacons, :latitude, :decimal, {:precision=>10, :scale=>6}
		add_column :beacons, :longitude, :decimal, {:precision=>10, :scale=>6}
  end
end
