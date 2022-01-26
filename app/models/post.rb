# frozen_string_literal: true

class Post < ApplicationRecord
  paginates_per 5
  max_paginates_per 5
  belongs_to :post_category
  has_many :comments, dependent: :destroy, class_name: 'PostComment'
  has_many :likes, dependent: :destroy, class_name: 'PostLike'
  belongs_to :creator, class_name: 'User'

  validates :body, presence: true, length: { minimum: 50 }
  validates :title, presence: true, length: { minimum: 5 }
end
