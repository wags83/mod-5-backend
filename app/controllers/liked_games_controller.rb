class LikedGamesController < ApplicationController
    def index
        liked_games = LikedGame.all
        render json: liked_games.to_json(:include => {:game => {:only => [:name, :art_url]}})
    end

    def show
        liked_game = LikedGame.all
        render json: liked_game
    end

    def like_game
        game_id = params[:id]
        game_name = params[:name]
        game_image = params[:image]
        user_id = params[:user_id]
        game_in_DB = Game.find_by(api_id: game_id)
        if game_in_DB
            liked_game = LikedGame.find_or_create_by(user_id: user_id, game_id: game_in_DB.id)

            render json: liked_game
        else
            new_game = Game.create(api_id: game_id, name: game_name, art_url: game_image)
            liked_game = LikedGame.find_or_create_by(user_id: user_id, game_id: new_game.id)

            render json: liked_game
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
