class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #adding something here, but not sure if it is going to be working, but sure how it works:  CHECK!!


  def user_signed_in?
    if session[:user_id] 
      true
    elsif @sign_in
      true
    else
      false
    end
  end
  helper_method :user_signed_in?

  def set_sign_in
    @sign_in = true
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def authorize
      render :new if !user_signed_in?
    end


end
