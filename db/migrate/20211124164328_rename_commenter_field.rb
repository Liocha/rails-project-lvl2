# frozen_string_literal: true

# top-level documentation comment for class RenameCommenterField
class RenameCommenterField < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_comments, :commenter, :commenter_id
  end
end
