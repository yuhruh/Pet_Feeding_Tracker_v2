class AddHungryExtendToResultTrackers < ActiveRecord::Migration[8.0]
  def change
    add_column :trackers, :hungry_extend, :string
    add_column :trackers, :result, :string
  end
end
