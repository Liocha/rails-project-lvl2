# frozen_string_literal: true

# top-level documentation comment for class RenamePostCommentFileld
class RenamePostCommentFileld < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_comments, :commenter_id, :user_id
  end
end
