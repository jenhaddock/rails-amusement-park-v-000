class UsersController < ApplicationController

  def homepage

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render :homepage
    else
      redirect_to new_user_path
    end
  end

  def require_login
    redirect_to '/login' unless session.include? :user_id
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end