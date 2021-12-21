Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #restaurants
  get '/restaurants/:page' => 'restaurants#index'
  get '/restaurant/:restaurant_id' => 'restaurants#show'
  # get '/restaurants_cuisine/:cuisine/:page' => 'restaurants#search_cuisine'
  get '/restaurants_zip/:zipcode/:page' => 'restaurants#search_zipcode'
  get '/restaurants_state/:state/:page' => 'restaurants#search_state'
  get '/restaurants_name/:name/:page' => 'restaurants#search_name'

  #my_restaurants
  get '/my_restaurants' => 'my_restaurants#index'
  post '/my_restaurants' => 'my_restaurants#create'
  get '/my_restaurants/:id' => 'my_restaurants#show'
  patch "/my_restaurants/:id" => "my_restaurants#update"

  #users
  post "/users" => "users#create"

  #sessions
  post "/sessions" => "sessions#create"

  #friendships


  #content
  get '/content' => 'contents#index'

  #comments

end
