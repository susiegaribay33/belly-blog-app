class ChangeIntegerLimitInMyrestaurantsTable < ActiveRecord::Migration[6.1]
  def change
    change_column :my_restaurants, :restaurant_id, :integer, limit: 8
  end
end
