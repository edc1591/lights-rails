class CreateX10devices < ActiveRecord::Migration
  def change
    create_table :x10devices do |t|
    	t.string :name
    	t.integer :deviceId
    	t.integer :houseCode
    	t.integer :deviceType
      t.timestamps
    end
  end
end
