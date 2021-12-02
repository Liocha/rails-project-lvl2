# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :post_category
  has_many :post_comments
  has_many :post_likes
  belongs_to :creator, class_name: 'User'

  validates :body, presence: true, length: { minimum: 50 }
  validates :title, presence: true, length: { minimum: 5 }
  validates :post_category_id, presence: true
end
