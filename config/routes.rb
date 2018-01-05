Rails.application.routes.draw do
  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:show]
  resources :users do
    resources :books
  end

  resources :categories, only: [:new, :create, :show]
  resources :book_records, only: [:new, :create, :show]
  # resources :books, only: [:show, :new, :create, :edit, :update, :destroy]
  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
