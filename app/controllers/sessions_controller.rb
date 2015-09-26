class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Hello, #{user.name}!"
      redirect_to root_path
    else
      flash[:error] = "Sorry, no record of that user."
      redirect_to sessions_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out succesfully."

    redirect_to root_url
  end

end
