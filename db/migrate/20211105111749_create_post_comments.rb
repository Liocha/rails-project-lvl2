# frozen_string_literal: true

# top-level documentation comment for class CreatePostComments
class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.text :content
      t.integer :commenter
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
