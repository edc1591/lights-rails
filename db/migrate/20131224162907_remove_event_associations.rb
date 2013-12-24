class RemoveEventAssociations < ActiveRecord::Migration
  def change
  	add_column :presets, :events, :text
  	remove_column :events, :preset_id
  end
end
