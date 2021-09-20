class AccountsController < ApplicationController
   
    def index
      #dashboard feed
      @posts = Post.active
      @comment =Comment.new
    end

    def show
      #user_profile
      @account = Account.find(params[:id])
    end


    def friend_result
        @pending_requests = current_account.pending_requests
        @friend_requests = current_account.recieved_requests
    end

    def my_friends
        @friends = current_account.friends
    end

    def search        
        if params[:friend].present?
            @friends = Account.search(params[:friend])
            @friends = current_account.except_current_account(@friends)
            if @friends
              respond_to do |format|
                format.js { render partial: 'accounts/friend_result' }
              end
            else
              respond_to do |format|
                flash.now[:alert] = "Couldn't find user"
                format.js { render partial: 'accounts/friend_result' }
              end
            end    
          else
            respond_to do |format|
              flash.now[:alert] = "Please enter a friend name or email to search"
              format.js { render partial: 'accounts/friend_result' }
            end  
        end
    end

end