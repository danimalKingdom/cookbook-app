class SessionsController < ApplicationController

  def new
  end

  def create
    #populate our session hash with user_id
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in"
      redirect_to '/recipes'
    else
      flash[:warning] = "Invalid email/password"
      redirect_to '/login'
    end
  end

  def destroy
    #erase session information
    session[:user_id] = nil
    flash[:success] = "Successfully logged out!"
    redirect_to '/login'
  end

end
