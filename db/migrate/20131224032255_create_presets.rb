class CreatePresets < ActiveRecord::Migration
  def change
    create_table :presets do |t|
    	t.string :name
    	t.integer :owner
      t.timestamps
    end

    add_column :events, :preset_id, :integer
  end
end
