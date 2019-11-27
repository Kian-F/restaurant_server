Rails.application.routes.draw do

  # post :user_token, to: 'user_token#create'
  post 'user/token' => 'user_token#create'
  get 'users/current' => 'users#current'

  root :to => "products#index"
  #this is added by K for testing
  resources :tokens, only:[:create]
  resources :users
  resources :orders
  resources :line_items
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
