class LikesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @like = current_account.likes.new(post_id: params[:post_id])
        @like.save
    end

    def destroy
        @like = current_account.likes.find(params[:id])
        @post = @like.post
        @like.destroy 
    end

    private

    def like_params
        params.require(:like).permit(:format)
    end
end
