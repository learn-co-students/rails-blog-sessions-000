RailsBlog::Application.routes.draw do
  resources :users
  resources :tags
  
  resources :posts do 
    resources :comments
  end

  resources :sessions

  get '/signup', to: "users#new"

  get '/login', to: "sessions#new"

  delete '/logout', to: "sessions#destroy", as: "logout"

  root 'posts#index'

end
