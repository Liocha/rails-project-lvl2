# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
  end

#  test '#create' do
 #   sign_in @user
  #  post post_likes_path(@post.id), params: {}
  #  assert_equal(@post.likes.count, 1)
  #  assert_response :redirect
 # end
end
