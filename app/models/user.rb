class User < ActiveRecord::Base
  has_secure_password

has_many :friendships
has_many :friends, through: :friendships 
has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
has_many :inverse_friends, :through => :inverse_friendships, :source => :user


has_many :friendship_requests, foreign_key: "sender_id"
has_many :receivers, through: :friendship_requests

has_many :inverse_friendship_requests, class_name: "FriendshipRequest", foreign_key: "receiver_id"
has_many :inverse_receivers, through: :inverse_friendship_requests, source: :sender


has_many :inbox_messages

end