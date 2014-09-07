class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] ||= @user.id
      redirect_to users_path
    else
      flash[:notice] = "Ooops, something went wrong, please sign in again!"
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path, notice: "Signed out"
  end
end
