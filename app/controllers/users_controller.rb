class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Private Events"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(users_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def users_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation, :profile_picture)
    end

end
