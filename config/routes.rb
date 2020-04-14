Rails.application.routes.draw do
  devise_for :users
  resources :game_v2s
  resources :words
  resources :games do
    member do
      get :play
    end
  end

  root to: "games#index"
end
