class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :picture
      t.string :website

      t.timestamps
    end
  end
end
