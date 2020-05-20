Rails.application.routes.draw do
  devise_for :users
  devise_for :headhunters
  root 'home#index'
  resources :jobs, only: [:show, :new, :create]
  resources :profiles, only: [:index, :show, :new, :create]
  
end
