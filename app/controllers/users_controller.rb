class UsersController < ApplicationController
    before_action :authenticate, :only => [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end

    def show
        @user = User.find(session[:user_id])
        @years = Year.where(user: @user.id)
    end

    def authenticate
        redirect_to login_path unless session[:user_id]
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
