class RenameEventType < ActiveRecord::Migration
  def change
  	rename_column :events, :eventId, :eventType
  end
end
