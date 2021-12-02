# frozen_string_literal: true

# top-level documentation comment for class AddUserToPostLikes
class AddUserToPostLikes < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :post_likes, :users, column: :creator_id
  end
end
