class CommentsController < ApplicationController
    def index
        comments = Comment.all
        render json: comments.to_json(:include => {:user => {only: :username}})
    end

    def show
        comment = Comment.all
        render json: comment.to_json(:include => {:user => {only: :username}})
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
        params.require(:comment).permit(:title, :body, :user_id, :game_id)
    end
end
