class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order(created_at: :desc)
    # @tweet = Tweet.new
    respond_to do |format|
      format.html
    end
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

  # private
  #   def tweet_params
  #     params.require(:tweet).permit(:content)
  #   end
end
