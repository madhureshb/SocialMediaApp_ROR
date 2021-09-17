class LikesController < ApplicationController
    def create
        
        @like = current_account.likes.new(post_id: params[:format])
        if !@like.save
            # flash[:alert] = "You have already like the post"
        end

        redirect_to  dashboard_path
    end

    def destroy
        @like = current_account.likes.find(params[:id])
        post = @like.post
        @like.destroy
        redirect_to dashboard_path
    end

    private

    def like_params
        params.require(:like).permit(:format)
    end
end
