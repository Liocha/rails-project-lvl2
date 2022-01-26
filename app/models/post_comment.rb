# frozen_string_literal: true

# top-level documentation comment for class PostComment
class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_ancestry
  validates :content, presence: true

  def self.children_with_descendants(child_ids)
    query = child_ids.map do |child_id|
      "(post_comments.id = '#{child_id}' OR post_comments.ancestry LIKE '%#{child_id}%')"
    end.join(' OR ')
    where(query)
  end
end
