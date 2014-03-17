class RemoveEventsFromBeacon < ActiveRecord::Migration
  def change
  	remove_column :beacons, :entry_event
  	remove_column :beacons, :exit_event
  end
end
