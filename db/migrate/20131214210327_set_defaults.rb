class SetDefaults < ActiveRecord::Migration
  def change
  	change_column :events, :state, :default => false
  	change_column :events, :repeat, :default => ""
  end
end
