# frozen_string_literal: true

# top-level documentation comment for class AddForeignKeyToPostComments
class AddForeignKeyToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :post_comments, :users
  end
end
