# frozen_string_literal: true

# top-level documentation comment for class AddIndexToPostComments
class AddIndexToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_index :post_comments, :user_id
  end
end
