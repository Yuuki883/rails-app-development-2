Rails.application.routes.draw do
  devise_for :users
  root to: 'books#top'
  get "home/about" => "about#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users
  end
