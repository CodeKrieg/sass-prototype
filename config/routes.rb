Rails.application.routes.draw do
  
  #Auth routes
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  
  #Root route
  root 'welcome#index'
  
  

end
