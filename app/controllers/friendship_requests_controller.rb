class FriendshipRequestsController < ApplicationController

def create
@friendship_request = FriendshipRequest.create()
@friendship_request.sender_id = current_user.id
@friendship_request.receiver_id = params[:receiver_id]

if @friendship_request.save

redirect_to user_path(current_user)
else
	redirect_to users_path
end
end

def destroy
	@friendship_request = FriendshipRequest.find(params[:id])
	
	InboxMessage.create(title: "rejected", body: "#{@friendship_request.receiver.name} rejected your friend request", user_id: @friendship_request.sender_id)
	
	@friendship_request.destroy
	redirect_to current_user
end

end
