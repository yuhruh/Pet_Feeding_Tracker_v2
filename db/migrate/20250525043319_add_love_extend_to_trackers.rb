class AddLoveExtendToTrackers < ActiveRecord::Migration[8.0]
  def change
    add_column :trackers, :love_extend, :string
  end
end
