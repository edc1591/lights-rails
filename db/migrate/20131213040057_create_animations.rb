class CreateAnimations < ActiveRecord::Migration
  def change
    create_table :animations do |t|
      t.string :name
      t.integer :animationId
      t.integer :speed
      t.integer :brightness
      t.timestamps
    end
  end
end
