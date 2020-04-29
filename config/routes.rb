Rails.application.routes.draw do
  resources :followers
  resources :liked_games
  resources :comments
  resources :users
  resources :games

  get '/new_releases', to: 'games#new_releases'
  get '/by_genre', to: 'games#by_genre'
  post '/liked_games/like_game/:id', to: 'liked_games#like_game'
  get 'game_comments/:id', to: 'comments#game_comments'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
