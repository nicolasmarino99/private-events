# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to Private Events'
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
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    upcoming_events
    previous_events
  end

  def upcoming_events
    @upcoming_events = current_user.attended_events.where('date > :current_time', current_time: DateTime.now)
  end

  def previous_events
    @previous_events = current_user.attended_events.where('date <= :current_time', current_time: DateTime.now)
  end

  private

  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_picture)
  end
end
