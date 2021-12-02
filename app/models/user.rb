# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_comments, foreign_key: 'commenter_id', class_name: 'PostComment'
  has_many :post_likes, foreign_key: 'creator_id', class_name: 'PostLike'
  has_many :posts, foreign_key: 'creator_id', class_name: 'Post'
end
