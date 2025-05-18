class AddWeightNoteToTrackers < ActiveRecord::Migration[8.0]
  def change
    add_column :trackers, :weight, :decimal, precision: 4, scale: 2
    add_column :trackers, :note, :string
  end
end
