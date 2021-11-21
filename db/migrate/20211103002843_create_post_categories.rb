# frozen_string_literal: true

# top-level documentation comment for class CreatePostCategories
class CreatePostCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :post_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
