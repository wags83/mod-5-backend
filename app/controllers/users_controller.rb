class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.all
        render json: user
    end

    def create
        user = User.new(user_params)
        if user.save!
            render json: user
        else
            render json: "Something went wrong.".to_json  
        end
    end

    def update 
        user = User.find(params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: "Something went wrong.".to_json  
        end
    end

    def destroy 
        user = User.find(params[:id])
        if user.destroy
            render json: user
        else
            render json: "Something went wrong.".to_json  
        end
    end

    def user_params
        params.require(:user).permit(:username, :password, :bio, :avatar_url, :favorite_genre)
    end
end
