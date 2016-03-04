class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :user_signed_in?

  def authorize
    if !user_signed_in?
      @user = User.new
      render "sessions/_form.html.erb"
    end
  end

  private

    def current_user
      @current_user = User.find(session["user_id"])
    end

    def user_signed_in?
      !!@current_user
    end

end
