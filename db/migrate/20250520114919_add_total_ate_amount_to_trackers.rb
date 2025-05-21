class AddTotalAteAmountToTrackers < ActiveRecord::Migration[8.0]
  def change
    add_column :trackers, :total_ate_amount, :decimal, precision: 5, scale: 2
  end
end
