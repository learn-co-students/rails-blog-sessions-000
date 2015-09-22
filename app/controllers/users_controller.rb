class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_sign_in
      session[:user_id] = @user.id
      redirect_to root_path(@user), :notice => "Thank you for signing up!"
    else
      render :new
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :password, :email)
      #there is another :password_confirmation attribute that is checked here, but that seems to not work for me.  CHECK!!
    end
end
