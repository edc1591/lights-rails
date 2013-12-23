class AddColorPermissionsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :color_zones, :text
  end
end
