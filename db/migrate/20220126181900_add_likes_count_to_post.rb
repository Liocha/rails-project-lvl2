# frozen_string_literal: true

# Style/Documentation: Missing top-level documentation comment for class AddLikesCountToPost
class AddLikesCountToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :post_likes_count, :integer
  end
end
