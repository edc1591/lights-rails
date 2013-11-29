class AddZoneToDevice < ActiveRecord::Migration
  def change
    add_column :x10devices, :zone, :integer
  end
end
