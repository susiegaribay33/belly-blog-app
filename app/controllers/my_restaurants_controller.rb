class MyRestaurantsController < ApplicationController
  before_action :authenticate_user
  
  def index #ALL saved restaurants for user, all statuses -> can show diff restaurants based on staus on frontend
    if current_user
      saved_restaurants = current_user.my_restaurants
      render json: saved_restaurants.as_json
    else
      render json: {message: "You need to be logged in in order to see your saved restaurants."}
    end
  end

  def create
    hours = params[:hours]
    if hours == "" || hours == nil
      hours = "Not Available"
    end

    price_range = params[:price_range]
    if price_range == "" || price_range == nil
      price_range = "Not Available"
    end

    website = params[:restaurant_website]
    if website == "" || website == nil
      website = "Not Available"
    elsif website.include? "http:///"
      website = website.sub('http:///', 'https://www.allmenus.com/')
    end

    cuisines = params[:cuisines]
    if cuisines == [] || cuisines == nil
      cuisines = "Not Available"
    end

    status = params[:restaurant_status]
    if status == "been"
      fav_menu_item = params[:fav_menu_item]
      if fav_menu_item == nil
        fav_menu_item = "Not sure"
      end
    end

    new_restaurant = MyRestaurant.new(
      user_id: current_user.id,
      restaurant_id: params[:restaurant_id],
      restaurant_status: params[:restaurant_status],
      restaurant_name: params[:restaurant_name],
      restaurant_phone: params[:restaurant_phone],
      restaurant_website: website,
      hours: hours,
      price_range: price_range,
      cuisines: cuisines,
      address: params[:address],
      fav_menu_item: fav_menu_item
    )
    # user = User.find(params[:user_id])
    new_restaurant.save
    if new_restaurant.save
      render json: new_restaurant
    else
      render json: {error: new_restaurant.errors.full_messages}
    end
  end

  def show
    the_restaurant = MyRestaurant.find_by(id: params[:id])
    if current_user
      render json: the_restaurant.as_json
    else
      render json: {message: "You need to be logged in in order to view this saved restaurant."}
    end
  end

  def update
    the_restaurant = MyRestaurant.find_by(id: params[:id])
    the_restaurant.restaurant_status = params[:restaurant_status] || the_restaurant.restaurant_status
    the_restaurant.fav_menu_item = params[:fav_menu_item] || the_restaurant.fav_menu_item
    the_restaurant.post = params[:post] || the_restaurant.post
    the_restaurant.save

    if the_restaurant.save
      render json: the_restaurant.as_json
    else
      render json: {error: the_restaurant.errors.full_messages}
    end
  end

end
