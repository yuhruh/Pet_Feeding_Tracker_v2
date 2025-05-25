class AddFrequencyToTrackers < ActiveRecord::Migration[8.0]
  def change
    add_column :trackers, :frequency, :integer
  end
end
