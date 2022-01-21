# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
    @post_comment = {
      content: Faker::Books::Lovecraft.sentence
    }
  end

  test '#create' do
    sign_in @user
    post post_comments_path(@post.id), params: { post_comment: @post_comment }
    post_comment = PostComment.find_by! content: @post_comment[:content]
    assert { post_comment }
    assert_response :redirect
  end
end
