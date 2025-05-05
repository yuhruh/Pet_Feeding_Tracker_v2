class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :time_zone
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
