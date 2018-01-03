Rails.application.routes.draw do
  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:show]
  resources :categories, only: [:new, :create, :show]
  resources :books, only: [:show]
  root to: 'users#index'

end
