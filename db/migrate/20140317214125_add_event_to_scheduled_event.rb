class AddEventToScheduledEvent < ActiveRecord::Migration
  def change
  	add_column :scheduled_events, :event, :text
  end
end
