class SessionsController < ApplicationController
  def new
  end

def create
@user = User.find_by_email(params[:email])
if @user && @user.authenticate(params[:password])
	session[:user_id] = @user.id
flash[:notice] = "new account created"
redirect_to user_path(current_user)
else
	flash[:notice] = "Error could not login"
	render 'new'
end
end

def destroy
session[:user_id] = nil 
flash[:notice] = "logged out"
redirect_to new_session_path
end


end
