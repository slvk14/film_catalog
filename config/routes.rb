Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'static_pages/home', to: 'static_pages#home'
  get 'static_pages/contact', to: 'static_pages#contact'
  get 'static_pages/about', to: 'static_pages#about'
  get 'movies/renew', to: 'movies#renew'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :update, :edit, :index]
  resources :movies, only: [:index, :show]
  resources :reviews
end
