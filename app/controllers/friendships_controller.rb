class FriendshipsController < ApplicationController

def create
 
@friendship = current_user.friendships.build(friend_id: params[:receiver_id])
if @friendship.save
@friendship_request = FriendshipRequest.find_by(receiver_id: current_user.id, sender_id: params[:receiver_id])
@friendship_request.invisible = true
@friendship_request.save

 InboxMessage.create(title: "accepted", body: "#{@friendship_request.receiver.name} accepted your friend request", user_id: params[:receiver_id])
	
redirect_to current_user
else
	redirect_to :back
end
end 


def destroy
	friendship = Friendship.find(params[:id])
	if current_user == friendship.user_id
	friendship_request = FriendshipRequest.where(sender_id: friendship.user_id, receiver_id: friendship.friend_id).first
else
	friendship_request = FriendshipRequest.where(sender_id: friendship.friend_id, receiver_id: friendship.user_id).first
end

if friendship.friend_id != current_user
InboxMessage.create(title: "unfriended", body: "#{current_user.name} unfriended you", user_id: friendship.friend_id)
else
	InboxMessage.create(title: "unfriended", body: "#{current_user.name} unfriended you", user_id: friendship.friend_id)
end

friendship.destroy
	friendship_request.destroy
	
	redirect_to current_user
end

end
