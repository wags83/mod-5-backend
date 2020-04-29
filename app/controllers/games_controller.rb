class GamesController < ApplicationController
    require 'rest-client'

    def index
        games = Game.all
        render json: games
    end

    def show
        api_id = params[:id]
        url = "https://api.rawg.io/api/games/#{api_id}"
        response = RestClient.get("#{url}")
        parsed_response = JSON.parse(response)
        
        render json: parsed_response
    end

    # def by_genre
    #     genre = params[:genre]

    #         if genre == "rpg" 
    #             genre = "role-playing-games-rpg"
    #         end
        
    #     url = "https://api.rawg.io/api/games?genres=#{genre}"
        
    #     response = RestClient.get("#{url}")
    #     parsed_response = JSON.parse(response)
        
    #     render json: parsed_response
    # end

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

    def new_releases
        url = "https://api.rawg.io/api/games?dates=2020-04-01,2020-04-28&platforms=18,1,7"
        response = RestClient.get("#{url}")
        parsed_response = JSON.parse(response)
        
        render json: parsed_response
    end


    private

    def game_params
        params.require(:game).permit(:name, :api_id, :art_url)
    end

end
