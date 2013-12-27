class CreateZonesUsers < ActiveRecord::Migration
  def change
  	drop_table :zones_users
    create_table :zones_users do |t|
      t.belongs_to :user
      t.belongs_to :zone
      t.timestamps
    end
    add_index :zones_users, :user_id
    add_index :zones_users, :zone_id
  end
end
