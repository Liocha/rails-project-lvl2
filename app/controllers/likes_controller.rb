# frozen_string_literal: true

# top-level documentation comment for class LikesController
class LikesController < ApplicationController
  before_action :require_login

  def create
    @post = Post.find(params[:post_id])
    @curr_like = @post.likes.find_by(user: current_user)
    @post.likes.create(user: current_user) if @curr_like.nil?
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @curr_like = @post.likes.find_by(user: current_user)
    @curr_like.destroy!
    redirect_to post_path(@post)
  end

  private

  def require_login
    return if user_signed_in?

    redirect_to new_user_session_url,
                flash: { warning: 'Вы должны войти в систему, чтобы получить доступ к этому действию!' }
  end
end
