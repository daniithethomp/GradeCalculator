class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(:id => @user.id)
    else
      message = "Invalid username or password"
      redirect_to login_path, notice: message
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
