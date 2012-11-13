class UsersController < ApplicationController
  def show
    @user = User.find_by_username(params[:user][:username])
    user = @user
    if user && user.authenticate(params[:user][:password])

      redirect_to user_urls_path(user)
    else
      flash.now[:error] = "Invalid email/password combination"
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create

    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You Signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    redirect_to user_urls_path(@user)
  end

  # def login
  #   @user = User.find_by_username(params[:user][:username])
  #   user = @user
  #   if user && user.authenticate(params[:user][:password])

  #     redirect_to user_urls_path(user)
  #   else
  #     flash.now[:error] = "Invalid email/password combination"
  #     redirect_to root_path
  #   end
  # end

  private
  def authorized?
    @user.password == params[:password]
  end


end