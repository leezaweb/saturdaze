class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user

        flash[:message] = "Thanks for joining #{@user.first_name}."

      redirect_to events_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
