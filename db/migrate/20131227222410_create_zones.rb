class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
    	t.boolean :has_colors
    	t.string :name
      t.timestamps
    end
  end

  add_column :users, :zone_id, :integer
  add_column :x10_devices, :zone_id, :integer
end
