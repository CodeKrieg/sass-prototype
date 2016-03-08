Rails.application.routes.draw do
  
  #Auth routes
  devise_for :users 
  
  #Root route
  root 'welcome#index'
  
  

end
