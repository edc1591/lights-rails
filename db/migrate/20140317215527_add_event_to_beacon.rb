class AddEventToBeacon < ActiveRecord::Migration
  def change
  	add_column :beacons, :entry_event, :text
  	add_column :beacons, :exit_event, :text
  end
end
