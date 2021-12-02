# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :commenter, class_name: 'User'
  belongs_to :post
  has_ancestry
end
