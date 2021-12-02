# frozen_string_literal: true

# top-level documentation comment for class RenamePostLikesFileld
class RenamePostLikesFileld < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_likes, :creator_id, :user_id
  end
end
