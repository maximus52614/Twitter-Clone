class UsersController < ApplicationController
  before_action :find_user, except: :index
  def index
    @users = User.all
  end

  def show
  end

  # def create
  #   @tweet = Tweet.create(content: params[:content], user_id: current_user.id)
  #     if @tweet.save
  #       redirect_to user_path(current_user),
  #         notice: "Tweet success!"
  #     else
  #        redirect_to user_path(current_user),
  #         notice: @tweet.errors.full_messages.to_sentence
  #     end
  # end
  # def update
  #   @user = User.update(params[:id])
  # end

  def edit
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
