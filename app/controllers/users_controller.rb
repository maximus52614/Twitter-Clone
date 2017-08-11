class UsersController < ApplicationController
  before_action :find_user, except: :index
  def index
    @users = User.all
  end

  def show
  end

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
