class AssociateUsersAndRooms < ActiveRecord::Migration
  def change
  	drop_table :zones_users
  	create_table :rooms_users do |t|
      t.belongs_to :user
      t.belongs_to :room
      t.timestamps
    end
    add_index :rooms_users, :user_id
    add_index :rooms_users, :room_id
  end
end
