class FriendshipsController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user = User.find(params[:friend_id])
    redirect_to @user
  end



  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend"
      redirect_to User.find(params[:friend_id])
    else
      flash[:error] = "Unable to add friend"
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed. "
    redirect_to '/friendships'
  end
end
