# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test '#create' do
    post = posts(:one)
    user = users(:one)
    sign_in user
    post post_likes_path(post.id), params: {}
    assert_response :redirect
  end
end
