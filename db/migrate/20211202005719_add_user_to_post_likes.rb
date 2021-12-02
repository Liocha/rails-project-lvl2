class AddUserToPostLikes < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :post_likes, :users, column: :creator_id
  end
end
