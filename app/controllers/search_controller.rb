class SearchController < ApplicationController
  def search
    @user = User.where(username: params[:search]).first
    redirect_to user_path(@user.id)
  end
end
