class LikedGamesController < ApplicationController
    def index
        liked_games = LikedGame.all
        render json: liked_games
    end

    def show
        liked_game = LikedGame.all
        render json: liked_game
    end

    def create
        liked_game = LikedGame.new(liked_game_params)
        if liked_game.save!
            render json: liked_game
        else
            render json: "Something went wrong.".to_json  
        end
    end

    def destroy 
        liked_game = LikedGame.find(params[:id])
        if liked_game.destroy
            render json: liked_game
        else
            render json: "Something went wrong.".to_json  
        end
    end

    def liked_game_params
        params.require(:liked_game).permit(:user_id, :game_id)
    end
end
