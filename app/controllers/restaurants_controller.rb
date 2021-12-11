class RestaurantsController < ApplicationController
  def index
    response = HTTP.headers("X-API-KEY" => "#{Rails.application.credentials.dm_api_key}").get("https://api.documenu.com/v2/restaurants/search/fields?fullmenu=true")
    render json: response.parse
  end

  def show
    response = HTTP.headers("X-API-KEY" => "#{Rails.application.credentials.dm_api_key}").get("https://api.documenu.com/v2/restaurant/#{params[:restaurant_id]}?")
    render json: response.parse
  end
end

#response = HTTP.get("https://api.documenu.com/v2/restaurant/#{params[:restaurant_id]}?key=#{Rails.application.credentials.dm_api_key}")
