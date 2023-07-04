Rails.application.routes.draw do
  resources :categories
  resources :items
  resources :users, only: [:create, :show, :index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
