class FollowersController < ApplicationController

    def index
        followers = Follower.all
        render json: followers.to_json(:include => {:user => {only: :username}})
    end

    def show
        follower = Follower.find(params[:id])
        render json: follower
    end

    def create
        follower = Follower.new(follower_params)
        if follower.save!
            render json: follower
        else
            render json: "Something went wrong.".to_json  
        end
    end

    def destroy 
        follower = Follower.find(params[:id])
        if follower.destroy
            render json: follower
        else
            render json: "Something went wrong.".to_json  
        end
    end

    def follower_params
        params.require(:follower).permit(:user_id, :follower_id)
    end

end
