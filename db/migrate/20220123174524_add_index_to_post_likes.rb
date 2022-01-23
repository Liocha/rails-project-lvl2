class AddIndexToPostLikes < ActiveRecord::Migration[6.1]
  def change
    add_index :post_likes, :user_id
  end
end
