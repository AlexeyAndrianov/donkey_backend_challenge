class AddSentTimestampToLocations < ActiveRecord::Migration[7.1]
  def change
    add_column :locations, :sent_timestamp, :datetime
  end
end
