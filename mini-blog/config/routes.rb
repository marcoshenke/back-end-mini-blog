Rails.application.routes.draw do
  resources :categories
  resources :users
  resources :posts

  resources :comments, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
