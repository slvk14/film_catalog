Rails.application.routes.draw do
  root to: 'movies#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :update, :edit, :index]
end
