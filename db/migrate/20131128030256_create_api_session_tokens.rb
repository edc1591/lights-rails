class CreateApiSessionTokens < ActiveRecord::Migration
  def change
    create_table :api_session_tokens do |t|

      t.timestamps
    end
  end
end
