class CreateTrackers < ActiveRecord::Migration[8.0]
  def change
    create_table :trackers do |t|
      t.integer :pet_id
      t.date :date
      t.time :feeding_time
      t.string :time_of_eat_back_and_forth
      t.string :type
      t.string :brand
      t.string :description
      t.decimal :amount, precision: 5, scale: 2
      t.decimal :left_amount, precision: 5, scale: 2
      t.integer :favorite_score, default: 0

      t.timestamps
    end
  end
end
