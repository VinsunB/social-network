class UsersController < ApplicationController

  def show
 @user = User.includes(:friendship_requests).find(params[:id])
 @inverse_friendship_requests = @user.inverse_friendship_requests.where(invisible: false)
 
 @friendship_requests = @user.friendship_requests.where(invisible: false)
 end

def index 
	@users = User.all
end

  def new
@user = User.new
  end

def create
@user = User.new(user_params)
if @user.save
	session[:user_id] = @user.id
	redirect_to root_path
else
	render 'new'
end
end

private

def user_params
	params.require(:user).permit(:name, :email, :password)
end

end
