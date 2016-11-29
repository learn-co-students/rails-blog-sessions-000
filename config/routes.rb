RailsBlog::Application.routes.draw do

  root 'posts#index'

  get 'signup' => 'users#new', :as => 'signup'
  get 'login' => 'sessions#new', :as => 'login'
  delete 'logout' => 'sessions#destroy', :as => 'logout'

  resources :sessions
  # Had to add this to get the short cuts routes to sessions working, no doubt.

  resources :users
  resources :tags
  
  resources :posts do 
    resources :comments, :only => [:new, :create, :edit, :destroy]
  end

end
