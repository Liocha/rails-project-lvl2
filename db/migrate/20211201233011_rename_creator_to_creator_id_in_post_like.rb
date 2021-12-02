# frozen_string_literal: true

# Missing top-level documentation comment for class RenameCreatorToCreatorIdInPostLike
class RenameCreatorToCreatorIdInPostLike < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_likes, :creator, :creator_id
  end
end
