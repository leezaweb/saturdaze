class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update,:destroy]
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def all
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      UserMailer.signup_confirmation(@user).deliver #CHANGE
      session[:user_id] = @user.id
      redirect_to events_path
    else
      render :new
    end
  end

  def update
    @user.update(user_params)
    if @user.valid?
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end


end
