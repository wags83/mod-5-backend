Rails.application.routes.draw do
  resources :followers
  resources :liked_games
  resources :comments
  resources :users
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
