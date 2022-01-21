# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @category = post_categories(:one)
    @attrs = {
      title: Faker::Movies::Ghostbusters.character,
      body: Faker::Movies::Ghostbusters.quote,
      post_category_id: @category.id
    }
  end

  test '#index' do
    get root_path
    assert_response :success
  end

  test '#new' do
    sign_in @user
    get new_post_path
    assert_response :success
  end

  test '#show' do
    post = posts(:one)
    get post_path(post)
    assert_response :success
  end

  test '#create' do
    sign_in @user
    post posts_path, params: { post: @attrs }
    post = Post.find_by! title: @attrs[:title]
    assert { post }
    assert_response :redirect
  end
end
