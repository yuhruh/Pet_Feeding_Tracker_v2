class AddFoodTypeToTrackers < ActiveRecord::Migration[8.0]
  def change
    remove_column :trackers, :type
    add_column :trackers, :food_type, :string
  end
end
