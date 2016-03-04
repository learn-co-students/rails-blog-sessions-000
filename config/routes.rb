RailsBlog::Application.routes.draw do

  root 'posts#index'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'signout', to: 'sessions#destroy'

  resources :users
  resources :tags

  resources :sessions, :only => [:create, :destroy, :new]
  
  resources :posts do 
    resources :comments
  end

end
