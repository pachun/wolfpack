Rails.application.routes.draw do
  root to: "games#index"
  resources :games
  resources :players
  resources :teams, only: [ :index ]
end
