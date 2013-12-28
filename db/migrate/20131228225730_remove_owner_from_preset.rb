class RemoveOwnerFromPreset < ActiveRecord::Migration
  def change
  	remove_column :presets, :owner
  end
end
