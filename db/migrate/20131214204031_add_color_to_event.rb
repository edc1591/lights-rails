class AddColorToEvent < ActiveRecord::Migration
  def change
  	add_column :events, :color, :text
  end
end
