Rails.application.routes.draw do
  root to: "games#index"
  resources :games, only: [ :index, :show, :edit, :update, :new, :create, :destroy ]
end
