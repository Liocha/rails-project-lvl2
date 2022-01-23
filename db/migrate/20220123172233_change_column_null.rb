# frozen_string_literal: true

# top-level documentation comment for class ChangeColumnNull
class ChangeColumnNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :post_comments, :user_id, false
  end
end
