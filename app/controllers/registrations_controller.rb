class User::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  
  protected
  
  def after_sign_up_path_for(resource)
    '/my_profile' # Or :prefix_to_your_route
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name)
    devise_parameter_sanitizer.for(:account_update).push(:first_name, :last_name, :twitter, :github, :gmail, :facebook)
  end
end