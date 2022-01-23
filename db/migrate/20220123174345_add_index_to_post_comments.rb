class AddIndexToPostComments < ActiveRecord::Migration[6.1]
  def change
     add_index :post_comments, :user_id
  end
end
