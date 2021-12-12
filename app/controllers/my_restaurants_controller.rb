class MyRestaurantsController < ApplicationController
  def index #ALL saved restaurants for user, all statuses -> can show diff restaurants based on staus on frontend
    if current_user
      saved_restaurants = current_user.my_restaurants
      render json: saved_restaurants.as_json
    else
      render json: {message: "You need to be logged in in order to see your saved restaurants."}
    end
  end

  def create
    new_restaurant = MyRestaurant.new(
      user_id: current_user.id,
      restaurant_id: params[:restaurant_id],
      restaurant_status: params[:restaurant_status],
      restaurant_name: params[:restaurant_name],
      restaurant_phone: params[:restaurant_phone],
      restaurant_website: params[:restaurant_website],
      hours: params[:hours],
      price_range: params[:price_range],
      cuisines: params[:cuisines],
      address: params[:address]
    )

    if current_user.my_restaurants.find_by(restaurant_id: params[:restaurant_id])
      render json: {message: "This restaurant is in your saved restaurants already. Please select another restaurant."}
    else
      new_restaurant.save
      render json: new_restaurant.as_json
    end
  end

  def show
    the_restaurant = MyRestaurant.find_by(id: params[:id])
    if current_user
      render json: the_restaurant.as_json
    else
      render json: "You need to be logged in in order to view this saved restaurant."
    end
  end

  def update
    the_restaurant = MyRestaurant.find_by(id: params[:id])
    the_restaurant.restaurant_status = params[:restaurant_status]
    the_restaurant.save

    if the_restaurant.save
      render json: the_restaurant
    else
      render json: {error: the_restaurant.errors.full_messages}
    end
  end

end
