class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
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

end
