class CommentsController < ApplicationController

    def create
        @post = Post.find(comment_params[:post_id])
        @comment = Comment.new(comment_params)
        @comment.account_id = current_account.id if account_signed_in? 
        @comment.save
    end

    private

    def comment_params
        params.require(:comment).permit(:comment, :post_id)
    end

end