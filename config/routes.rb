# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root to: 'movies#index'
  get 'static_pages/home', to: 'static_pages#home'
  get 'static_pages/contact', to: 'static_pages#contact'
  get 'static_pages/about', to: 'static_pages#about'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[show update edit index]

  resources :movies, only: %i[index new show destroy] do
    resources :reviews
  end

  resources :watch_later_movies, only: [:index] do
    post :add_to_list
    delete :remove_from_watch_later
  end

  namespace :admin do
    resources :movies
    resources :reviews, only: %i[index edit update destroy]
    get '/refresh', to: 'movies#refresh_movies'
  end

  namespace :api do
    resources :movies
  end
end
