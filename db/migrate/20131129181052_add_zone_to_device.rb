class AddZoneToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :zone, :integer
  end
end
