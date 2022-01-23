class ChangeColumnNotNullToPostLikes < ActiveRecord::Migration[6.1]
  def change
    change_column_null :post_likes, :user_id, false
  end
end
