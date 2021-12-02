class RenameCreatorToCreatorIdInPostLike < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_likes, :creator, :creator_id
  end
end
