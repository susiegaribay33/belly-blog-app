class AddPostToMyRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :my_restaurants, :post, :text
  end
end
