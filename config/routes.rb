Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  root 'posts#index'
  resources :users do
    resources :profiles
  end
  resources :posts do
    collection do
      get 'search'
    end
  end
    
end
