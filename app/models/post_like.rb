# frozen_string_literal: true

class PostLike < ApplicationRecord
  belongs_to :post
  belongs_to :creator, class_name: 'User'
end