# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    get root_path
    assert_response :success
  end

  test '#new' do
    user = users(:one)
    sign_in user
    get new_post_path
    assert_response :success
  end

  test '#show' do
    post = posts(:one)
    get post_path(post)
    assert_response :success
  end

  test '#create' do
    user = users(:one)
    category = post_categories(:one)
    sign_in user
    post posts_path, params: { post: { title: 'Why do we use it?', post_category_id: category.id, body: 't is a long established fact that a reader will be distracted by the readable' } }
    assert_response :redirect
  end
end
