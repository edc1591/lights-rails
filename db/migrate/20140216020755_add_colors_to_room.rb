class AddColorsToRoom < ActiveRecord::Migration
  def change
  	add_column :rooms, :has_colors, :boolean
  end
end
