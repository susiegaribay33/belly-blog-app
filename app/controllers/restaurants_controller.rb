class RestaurantsController < ApplicationController
  def index
    response = HTTP.headers("X-API-KEY" => "#{Rails.application.credentials.dm_api_key}").get("https://api.documenu.com/v2/restaurants/search/fields?page=#{params[:page]}&fullmenu=true")
    render json: response.parse
  end

  def show
    response = HTTP.headers("X-API-KEY" => "#{Rails.application.credentials.dm_api_key}").get("https://api.documenu.com/v2/restaurant/#{params[:restaurant_id]}?")
    render json: response.parse
  end

  # def search_cuisine
  #   response = HTTP.headers("X-API-KEY" => "#{Rails.application.credentials.dm_api_key}").get("https://api.documenu.com/v2/restaurants/search/fields?page=#{params[:page]}&cuisine=#{params[:cuisine]}")
  #   render json: response.parse
  # end

  def search_zipcode
    response = HTTP.headers("X-API-KEY" => "#{Rails.application.credentials.dm_api_key}").get("https://api.documenu.com/v2/restaurants/search/fields?page=#{params[:page]}&zip_code=#{params[:zipcode]}&fullmenu=true")
    render json: response.parse
  end

  def search_state
    response = HTTP.headers("X-API-KEY" => "#{Rails.application.credentials.dm_api_key}").get("https://api.documenu.com/v2/restaurants/search/fields?page=#{params[:page]}&state=#{params[:state]}&fullmenu=true")
    render json: response.parse
  end

  def search_name
    response = HTTP.headers("X-API-KEY" => "#{Rails.application.credentials.dm_api_key}").get("https://api.documenu.com/v2/restaurants/search/fields?page=#{params[:page]}&restaurant_name=#{params[:name]}&fullmenu=true")
    render json: response.parse
  end

end

#response = HTTP.get("https://api.documenu.com/v2/restaurant/#{params[:restaurant_id]}?key=#{Rails.application.credentials.dm_api_key}")
