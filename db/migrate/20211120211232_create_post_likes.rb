# frozen_string_literal: true

# top-level documentation comment for class CreatePostLikes
class CreatePostLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_likes do |t|
      t.integer :creator
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
