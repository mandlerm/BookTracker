Rails.application.routes.draw do
  devise_for :users,  :controllers => {
            :omniauth_callbacks => "users/omniauth_callbacks",
            sessions: 'users/sessions',
            registrations: 'users/registrations'
          }
  resources :users, only: [:show]
  resources :users do
    resources :books
  end

  resources :categories, only: [:new, :create, :show]
  resources :book_records, only: [:new, :create, :show, :update]
  # resources :books, only: [:show, :new, :create, :edit, :update, :destroy]
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  unauthenticated do
   root :to => 'devise/sessions#new'
  end

  authenticated :user do
    root :to => 'users#show', as: :authenticated_root
  end

  get '/users' => 'users#show', as: :user_root
  get '/users/:id/records' => 'users#records', as: :user_records
  get '/books/most_comments' => 'books#most_comments', as: :most_comments
  get '/books/favorites' => 'books#favorites', as: :favorites
  get '/comment/:id/edit' => 'book_records#edit', as: :edit_book_comment
end
