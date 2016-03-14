class WelcomeController < ApplicationController

    def index
        if current_user && user_signed_in? 
           redirect_to my_profile_path 
        end
    end
    
    def about
        
    end
    
end
