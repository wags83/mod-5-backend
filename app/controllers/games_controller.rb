class GamesController < ApplicationController

    def index
        games = Game.all
        render json: games
    end

    def show
        game = Game.all
        render json: game
    end

    def create
        game = Game.new(game_params)
        if game.save!
            render json: game
        else
            render json: "Something went wrong.".to_json  
        end
    end

    def update 
        game = Game.find(params[:id])
        if game.update(game_params)
            render json: game
        else
            render json: "Something went wrong.".to_json  
        end
    end

    def destroy 
        game = Game.find(params[:id])
        if game.destroy
            render json: game
        else
            render json: "Something went wrong.".to_json  
        end
    end

    def game_params
        params.require(:game).permit(:name, :api_id, :art_url)
    end

end
