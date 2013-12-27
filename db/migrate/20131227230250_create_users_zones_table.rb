class CreateUsersZonesTable < ActiveRecord::Migration
  def change
    create_table :zones_users, :id => false do |t|
      t.references :zone
      t.references :user
    end
    add_index :zones_users, [:zone_id, :user_id]
    add_index :zones_users, :user_id
  end
end
