class CreateMyRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :my_restaurants do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.string :restaurant_status
      t.string :restaurant_name
      t.string :restaurant_phone
      t.string :restaurant_website
      t.string :hours
      t.string :price_range
      t.string :cuisines
      t.string :address

      t.timestamps
    end
  end
end
