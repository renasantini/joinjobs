Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users,
              controllers: { sessions: 'users/sessions',
                            registrations: 'users/registrations',
                            confirmations: 'users/confirmations',
                            passwords: 'users/passwords' }
  devise_for :headhunters, 
              controllers: { sessions: 'headhunters/sessions',
                            registrations: 'headhunters/registrations',
                            confirmations: 'headhunters/confirmations',
                            passwords: 'headhunters/passwords' }

  resources :jobs, only: [:index, :show]

  namespace :headhunters do
    resources :jobs, only: [:index, :show, :new, :create]
    resources :profiles, only: [:index, :show]
  end

  namespace :users do
    resources :jobs, only: [:index, :show] 
    resources :applications, only: [:index, :show, :new, :create]
    resources :profiles, only: [:index, :show, :new, :create]
  end
end
