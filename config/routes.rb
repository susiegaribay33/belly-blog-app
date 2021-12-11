Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #restaurants
  get '/restaurants' => 'restaurants#index'
  get '/restaurant/:restaurant_id' => 'restaurants#show'

  #my_restaurants
  get '/my_restaurants' => 'restaurants#index'

  #users

  #friendships

  #content

  #comments

end
