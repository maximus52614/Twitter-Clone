class TweetsController < ApplicationController
  def index
    @tweets =  Tweet.where(user_id: feed_user_ids).includes(:user).order(created_at: :desc)
                  #  .collect{|u| u.tweets.paginate(:page => params[:page])}
                  #  .flatten
  end

  def create
    # @tweet = Tweet.new(tweet_params.merge(user_id: current_user.id))
    @tweet = Tweet.create(content: params[:content], user_id: current_user.id)
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_path }
      else
        flash[:notice] = "Failed to Tweet!"
        format.html { redirect_to tweets_path }
      end
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
