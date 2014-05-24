class CreateUsersPresets < ActiveRecord::Migration
  def change
    create_table :users_presets do |t|
      t.belongs_to :user
      t.belongs_to :preset
      t.timestamps
    end
    add_index :users_presets, :user_id
    add_index :users_presets, :preset_id
  end
end
