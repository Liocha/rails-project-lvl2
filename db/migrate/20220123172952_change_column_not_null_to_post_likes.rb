# frozen_string_literal: true

# top-level documentation comment for class ChangeColumnNotNullToPostLikes
class ChangeColumnNotNullToPostLikes < ActiveRecord::Migration[6.1]
  def change
    change_column_null :post_likes, :user_id, false
  end
end
