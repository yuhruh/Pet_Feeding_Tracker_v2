class AddTransformedTimeToTrackers < ActiveRecord::Migration[8.0]
  def change
    add_column :trackers, :transformed_time, :date
  end
end
