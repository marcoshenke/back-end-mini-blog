Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :kind_users
  resources :categories
  resources :posts
  resources :users

  resources :comments, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'posts#index'
end
