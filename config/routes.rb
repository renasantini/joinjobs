Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users, path: 'user',
              controllers: { sessions: 'user/sessions',
                            registrations: 'user/registrations',
                            confirmations: 'user/confirmations',
                            passwords: 'user/passwords' }
  devise_for :headhunters, path: 'headhunter',
              controllers: { sessions: 'headhunter/sessions',
                            registrations: 'headhunter/registrations',
                            confirmations: 'headhunter/confirmations',
                            passwords: 'headhunter/passwords' }

  resources :jobs, only: [:index, :show]

  namespace :headhunter do
    resources :jobs, only: [:index, :show, :new, :create]
    resources :profiles, only: [:index, :show]
  end

  namespace :user do
    resources :jobs, only: [:index, :show] do
      resources :applications, only: [:index, :new, :create]
    end
    resources :applications, only: [:index, :show]
    resources :profiles, only: [:index, :show, :new, :create]
  end
end
