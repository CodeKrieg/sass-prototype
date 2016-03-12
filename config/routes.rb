Rails.application.routes.draw do
  
  #Auth routes
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", :registrations => "user/registrations" }
  
  #Friend list page
  get 'my_friends', to: 'users#my_friends'
  
  get 'connect', to: 'users#index'
  
  #User profile
  get 'my_profile', to: 'users#my_profile'
  
  #Resources
  resources :users
  resources :friendships
  
  resources :conversations do
    resources :messages
  end
  
  # root => if user is authenticated
   authenticated :user do
    root 'users#my_profile'
  end
  
  # root => if user is not authenticated
  unauthenticated :user do
    devise_scope :user do
      get "/" => "welcome#index"
    end
  end
  
  #Friendships
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'
  get 'add_friend', to: 'users#add_friend'
  
end