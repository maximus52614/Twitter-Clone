class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find_by_username!(params[:user_username])

    current_user.follow(@user) if current_user?

    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find_by_username!(params[:user_username])

    current_user.stop_following(@user) if current_user?

    redirect_to user_path(@user)
  end

  private

  def current_user?
    current_user.id != @user.id
  end
end
