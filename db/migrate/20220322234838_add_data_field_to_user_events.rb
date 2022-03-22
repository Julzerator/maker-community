class AddDataFieldToUserEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :user_events, :data, :json, default: {}
  end
end
