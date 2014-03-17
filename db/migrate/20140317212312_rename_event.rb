class RenameEvent < ActiveRecord::Migration
  def change
  	rename_table :events, :scheduled_events
  end
end
