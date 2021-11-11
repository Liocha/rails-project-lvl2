# frozen_string_literal: true

class Post < ApplicationRecord
  has_one :post_category
  has_many :post_comments

  validates :body, presence: true, length: { minimum: 50 }
  validates :title, presence: true, length: { minimum: 5 }
  validates :post_category_id, presence: true
end
