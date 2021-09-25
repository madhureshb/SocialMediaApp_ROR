class PostsController < ApplicationController
    before_action :authenticate_account!
    
    def new
        @post = Post.new
        #@account_id = Account.find(params[:account_id])
    end

    def create
        @post = Post.new(post_params)
        @post.account_id = current_account.id if account_signed_in? 
        if @post.save     
            redirect_to dashboard_path, flash: { success: "Post was created successfully!"}
        else
            redirect_to new_post_path, flash: { alert: "Post was not saved because your are exceeding the limit of 150 character"}
        end
    end

    def show
        @posts = Post.find(params[:id])
        @related_posts = @posts.find_related_tags
    end

    def tagged
        if params[:tag].present?
          @posts = Post.tagged_with(params[:tag])
        else
          @posts = Post.all
        end
    end


    private

    def post_params
        params.require(:post).permit(:description, :id, :main_image, :tag_list)
    end

end