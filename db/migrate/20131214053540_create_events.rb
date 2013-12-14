class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.integer :eventId
    	t.integer :time
    	t.string :timeZone
    	t.boolean :state
    	t.text :repeat
    	t.integer :speed
    	t.integer :brightness
    	t.integer :deviceId
    	t.integer :command
      t.timestamps
    end
  end
end
