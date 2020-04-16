Rails.application.routes.draw do
  devise_for :users
  resources :game_v2s
  resources :words do
    collection do
      get :add_form
      post :add_words
    end
  end

  resources :games do
    member do
      get :play
      get :rotate
    end
  end

  root to: "games#index"
end
