class CreateFriendshipRequests < ActiveRecord::Migration
  def change
    create_table :friendship_requests do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :invisible, default: false

      t.timestamps
    end
  end
end
