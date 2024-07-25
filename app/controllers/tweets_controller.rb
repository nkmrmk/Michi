class TweetsController < ApplicationController
    before_action :authenticate_user!
    def index
        @tweets = Tweet.all
    search = params[:search]
    @tweets = @tweets.joins(:user).where("body LIKE ?", "%#{search}%") if search.present?
    @tweets = @tweets.page(params[:page]).per(3)
    @rank_tweets = Tweet.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}.first(3)
    if params[:tag_ids].present?
      tweet_ids = []
      params[:tag_ids].each do |key, value| 
        if value == "1"
          Tag.find_by(name: key).tweets.each do |p| 
            tweet_ids << p.id
          end
        end
      end
      tweet_ids = tweet_ids.uniq
      #キーワードとタグのAND検索
      @tweets = @tweets.where(id: tweet_ids) if tweet_ids.present?
    end
    end

    def index2
      @tweets = Tweet.all
  search = params[:search]
  @tweets = @tweets.joins(:user).where("body LIKE ?", "%#{search}%") if search.present?
  @tweets = @tweets.page(params[:page]).per(3)
  @rank_tweets = Tweet.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}.first(3)
  if params[:tag_ids].present?
    tweet_ids = []
    params[:tag_ids].each do |key, value| 
      if value == "1"
        Tag.find_by(name: key).tweets.each do |p| 
          tweet_ids << p.id
        end
      end
    end
    tweet_ids = tweet_ids.uniq
    #キーワードとタグのAND検索
    @tweets = @tweets.where(id: tweet_ids) if tweet_ids.present?
  end
  end

    def new
        @tweet = Tweet.new
    end

    def create
        tweet = Tweet.new(tweet_params)

        tweet.user_id = current_user.id

        if tweet.save
         redirect_to :action => "index"
        else
         redirect_to :action => "new"
        end
      end
      def show
        @tweet = Tweet.find(params[:id])
      end

      def edit
        @tweet = Tweet.find(params[:id])
      end

      def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
          redirect_to :action => "show", :id => tweet.id
        else
          redirect_to :action => "new"
        end
      end
      def destroy
      tweet = Tweet.find(params[:id])
      tweet.destroy
      redirect_to action: :index
    end

    private
      def tweet_params
        params.require(:tweet).permit(:title, :spot, :body, :chain, :photo, :lat,:lng, tag_ids: [])
      end

      
end
