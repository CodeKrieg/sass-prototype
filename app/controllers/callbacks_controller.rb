class CallbacksController < Devise::OmniauthCallbacksController
    
    # Callback example
    # def digitalocean
    #     @user = User.from_omniauth(request.env["omniauth.auth"])
    #     sign_in_and_redirect @user
    # end
    
    def facebook #Callback for Facebook
       @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user 
    end
    
    def github #Callback for GitHub
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user 
    end 
    
end