Rails.application.routes.draw do
  
  #Auth routes
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", :registrations => "user/registrations" }
  
  #Root route
  root 'welcome#index'
  
  #Friend list page
  get 'my_friends', to: 'users#my_friends'
  
  #User profile
  get 'my_profile', to: 'users#my_profile'
  
  #Resources
  resources :users, only: [:show]
  resources :friendships

  #Friendships
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'
  get 'add_friend', to: 'users#add_friend'
  
  
end
