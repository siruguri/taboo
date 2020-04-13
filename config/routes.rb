Rails.application.routes.draw do
  resources :game_v2s
  resources :words
  resources :games do
    member do
      get :play
    end
  end
end
