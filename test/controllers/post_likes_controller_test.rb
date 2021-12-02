# frozen_string_literal: true

require 'test_helper'

class PostLikesControllerTest < ActionDispatch::IntegrationTest
  test '#create' do
    post = posts(:one)
    user = users(:one)
    sign_in user
    post post_post_likes_path(post.id), params: {}
    assert_response :redirect
  end
end
