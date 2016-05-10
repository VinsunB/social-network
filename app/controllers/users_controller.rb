class UsersController < ApplicationController

  def show
 @user = User.includes(:friendship_requests, :inbox_messages).find(params[:id])
 @inverse_friendship_requests = @user.inverse_friendship_requests.where(invisible: false)
 
 @friendship_requests = @user.friendship_requests.where(invisible: false)
 @messages = @user.inbox_messages.limit(5).order("created_at DESC")
 
@user_friendships =  @user.friendships#.to_a
 @user_inverse_friendships = @user.inverse_friendships#.to_a
 end

def index 
	friended_users = current_user.friends.to_a 
	
friend_requests = current_user.receivers.to_a

all_users = User.all.to_a 
@users = all_users - friended_users - friend_requests

end

  def new
@user = User.new
  end

def create
@user = User.new(user_params)
if @user.save
	session[:user_id] = @user.id
	redirect_to current_user
else
	render 'new'
end
end

private

def user_params
	params.require(:user).permit(:name, :email, :password)
end

end
