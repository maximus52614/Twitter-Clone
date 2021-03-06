class TweetsController < ApplicationController
  def index
    @tweets =  Tweet.where(user_id: feed_user_ids)
                    .includes(:user)
                    .order(created_at: :desc)

    @user = current_user
  end

  def create
    # @tweet = Tweet.new(tweet_params.merge(user_id: current_user.id))
    @tweet = Tweet.create(content: params[:content], user_id: current_user.id)
      if @tweet.save
        redirect_to tweets_path,
          notice: "Tweet success!"
      else
         redirect_to tweets_path,
          notice: @tweet.errors.full_messages.to_sentence
      end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if
      @tweet.update(content: params[:content])
        redirect_to tweets_path,
         notice: "Edit succcess!"
    else
      redirect_to tweets_path,
       notice: @tweet.errors.full_messages.to_sentence
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  private

  def feed_user_ids
    current_user.following_users.ids << current_user.id
  end

  # def account_update_params
  #   params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password, :picture)
  # end


  # def show
  #   @tweet = Tweet.find(params[:id])
  #   @username = @tweet.user.username
  #   @message="string"
  # end
  # private
  #   def tweet_params
  #     params.require(:tweet).permit(:content)
  #   end
end
