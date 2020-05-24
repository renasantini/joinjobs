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

  namespace :headhunter do
    resources :jobs, only: [:index, :show, :new, :create] do
      resources :applications, only: [:index, :show]
      resources :users, only: [:index] do
        resources :profiles, only: [:show] do
          resources :feedbacks, only: [:new, :create]
        end
      end
    end
    resources :comments, only: [:create]
    resources :profiles, only: [:index] do
      resources :favorites, only: [:new, :create]
    end
    resources :favorites, only: [:index]
    resources :feedbacks, only: [:index]
  end

  namespace :user do
    resources :jobs, only: [:index, :show] do
      resources :applications, only: [:index, :new, :create]
    end
    resources :applications, only: [:index, :show]
    resources :profiles, only: [:index, :show, :new, :create]
    resources :answers, only: [:create]
  end
end
