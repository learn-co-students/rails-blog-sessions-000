class SessionsController < ApplicationController

 def new
 end

  def create
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Welcome back, #{user.name}!"
    else
      flash.now.alert = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end


  #Not sure how to pry into this, so therefore I'm not really sure how the whole thing is working...  CHECK!!

end  