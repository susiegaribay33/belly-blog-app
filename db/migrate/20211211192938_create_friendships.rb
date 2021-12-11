class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.integer :sender_id
      t.integer :receiver
      t.string :status

      t.timestamps
    end
  end
end
