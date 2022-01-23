# frozen_string_literal: true

class PostCategory < ApplicationRecord
  has_many :posts

  validates :name, presence: true
end
