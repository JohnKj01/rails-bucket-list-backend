Rails.application.routes.draw do
  resources :categories
  resources :items
  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  resources :users, only: [:create, :show] do 
    resources :items, only: [:create, :show, :patch, :index, :destroy]
 end

end
