class AccountsController < ApplicationController
   
    def friend_result
        @pending_requests = current_account.pending_requests
        @friend_requests = current_account.recieved_requests
    end

    def my_friends
        @friends = current_account.friends
    end

    def search        
        if params[:friend].present?
            @friend = params[:friend]
            if @friend
              respond_to do |format|
                format.js { render partial: 'accounts/friend_result' }
              end
            else
              respond_to do |format|
                flash.now[:notice] = "Couldn't find user"
                format.js { render partial: 'accounts/friend_result' }
              end
            end    
          else
            respond_to do |format|
              flash.now[:notice] = "Please enter a friend name or email to search"
              format.js { render partial: 'accounts/friend_result' }
            end  
        end
    end

end