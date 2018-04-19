class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to events_path
    else
      flash[:message] = "Invalid User."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
