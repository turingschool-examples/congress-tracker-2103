class UsersController < ApplicationController
    def new 
        @user = User.new
    end 

    def create
        user = user_params
        user[:username] = user[:username].downcase
        new_user = User.create(user)
        flash[:success] = "Welcome, #{new_user.username}!"
        redirect_to root_path
    end

    private 

    def user_params 
        params.require(:user).permit(:username, :password)
    end 
end 