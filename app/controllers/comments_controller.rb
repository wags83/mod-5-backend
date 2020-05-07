class CommentsController < ApplicationController
    def index
        comments = Comment.all
        render json: comments.to_json(:include => {:user => {:only => [:username, :avatar_url]}})
    end

    def game_comments
        api_id = params[:id]
        game_in_db = Game.find_by(api_id: api_id)
        if game_in_db
            render json: game_in_db.comments.to_json(:include => {:user => {:only => [:username, :avatar_url]}})
        else
            render json: {message: "No Reviews Yet"}
        end
    end

    def new_comment
        api_id = params[:api_id]
        game_in_db = Game.find_by(api_id: api_id)
        content = params[:content]
        title = params[:title]
        user_id = params[:user_id]
        image = params[:image]
        name = params[:name]

        if game_in_db 
            new_comment = Comment.create(user_id: user_id, title: title, content: content, user_id: user_id, game_id: game_in_db.id)

            render json: new_comment.to_json(:include => {:user => {:only => [:username, :avatar_url]}})
        else
            new_game = Game.create(api_id: api_id, name: name, art_url: image)
            new_comment = Comment.create(user_id: user_id, title: title, content: content, user_id: user_id, game_id: new_game.id)

            render json: new_comment.to_json(:include => {:user => {:only => [:username, :avatar_url]}})
        end
    end


    def show
        comment = Comment.all
        render json: comment.to_json(:include => {:user => {:only => [:username, :avatar_url]}})
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save!
            render json: comment
        else
            render json: "Something went wrong.".to_json  
        end
    end

    def update 
        comment = Comment.find(params[:id])
        if comment.update(comment_params)
            render json: comment
        else
            render json: "Something went wrong.".to_json  
        end
    end

    def destroy 
        comment = Comment.find(params[:id])
        if comment.destroy
            render json: comment
        else
            render json: "Something went wrong.".to_json  
        end
    end

    def comment_params
        params.require(:comment).permit(:title, :content, :user_id, :game_id)
    end
end
