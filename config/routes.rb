Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index]
  #[]内最後のカンマは消すこと
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
