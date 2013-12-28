class RenameZoneInEvent < ActiveRecord::Migration
  def change
  	rename_column :events, :zone, :zone_id
  end
end
