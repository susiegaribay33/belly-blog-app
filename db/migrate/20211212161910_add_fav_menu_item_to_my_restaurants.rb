class AddFavMenuItemToMyRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :my_restaurants, :fav_menu_item, :string
  end
end
