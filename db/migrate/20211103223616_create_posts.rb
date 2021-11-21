# frozen_string_literal: true

# top-level documentation comment for class CreatePosts
class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :post_category, null: false, foreign_key: true
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
