class MyUserController < ApplicationController
    
    def new
        @user_name = current_user.name;
    end
end
