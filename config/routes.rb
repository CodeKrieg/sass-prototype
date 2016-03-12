Rails.application.routes.draw do
  
  #Auth routes
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", :registrations => "user/registrations" }
  
  
  #Root route
   # root 'welcome#index'
  
  #Friend list page
  get 'my_friends', to: 'users#my_friends'
  
  get 'chat', to: 'users#index'
  
  #User profile
  get 'my_profile', to: 'users#my_profile'
  
  #Resources
  resources :users
  resources :friendships
  
  resources :conversations do
    resources :messages
  end
  
  # From the github
   authenticated :user do
    root 'users#index'
  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end
  
  #Friendships
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'
  get 'add_friend', to: 'users#add_friend'
  
end