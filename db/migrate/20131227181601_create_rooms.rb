class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
    	t.string :name
      t.timestamps
    end

    add_column :x10devices, :room_id, :integer
  end
end
