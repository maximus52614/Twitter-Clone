class PostsController < ApplicationController
    def index
      @user = User
        .where("username LIKE ?", "%#{search_params[:search]}%").first
        redirect_to user_path(@user)
  end

  private

  def search_params
    params.permit(:search)
  end

  def search
    User
      .where("username LIKE ?", "%#{search_params[:search]}%")
      .where("content LIKE ?", "%#{search_params[:search]}%")
  end
end
