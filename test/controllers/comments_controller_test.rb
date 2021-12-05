# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test '#create' do
    post = posts(:one)
    user = users(:one)
    sign_in user
    post post_comments_path(post.id), params: { post_comment: { content: 'Why do we use it?' } }
    assert_response :redirect
  end
end
