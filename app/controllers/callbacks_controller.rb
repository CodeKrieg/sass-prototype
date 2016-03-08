class CallbacksController < Devise::OmniauthCallbacksController
    # def digitalocean
    #     @user = User.from_omniauth(request.env["omniauth.auth"])
    #     sign_in_and_redirect @user
    # end
    
    def facebook
       @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user 
    end
    
    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user 
    end 
    
end