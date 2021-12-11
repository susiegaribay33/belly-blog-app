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
    
  end

end
