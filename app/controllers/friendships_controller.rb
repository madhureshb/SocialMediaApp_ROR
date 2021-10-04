class FriendshipsController < ApplicationController

  def create  
    @friend = current_account.friendships.create(account_id: params[:user_id], friend_id: params[:friend_id], status: 0)
    friend_account = Account.find_by(id: params[:friend_id])

    if friend_account.present?
      friend_account.friendships.create(account_id: friend_account.id, friend_id: params[:user_id], status: 1)
    end
    redirect_to my_friends_path
  end

  def update
    @friend = Friendship.find_by(id: params[:id])
    if @friend.present?
      @friend.status = params[:status].to_i
      if @friend.save
        redirect_to my_friends_path
      end
    end
  end

  def destroy
    friendship = Friendship.find_by(id: params[:id])
    friendship.destroy
    flash[:notice] = "Stopped following"
    redirect_to my_friends_path
  end

end
