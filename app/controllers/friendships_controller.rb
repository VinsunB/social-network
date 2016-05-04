class FriendshipsController < ApplicationController

def create
 
@friendship = current_user.friendships.build(friend_id: params[:receiver_id])
if @friendship.save
@friendship_request = FriendshipRequest.find_by(receiver_id: current_user.id, sender_id: params[:receiver_id])
@friendship_request.invisible = true
@friendship_request.save
#@friendship_request.delete
redirect_to current_user
else
	redirect_to :back
end
end 


end
