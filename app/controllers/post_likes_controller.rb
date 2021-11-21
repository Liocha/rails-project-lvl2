# frozen_string_literal: true

# top-level documentation comment for class PostLikesController

class PostLikesController < ApplicationController
  before_action :require_login

  def create
    user_id = current_user[:id]
    @post = Post.find(params[:post_id])
    @curr_like = @post.post_likes.find_by(creator: user_id)
    if @curr_like.nil?
      @post.post_likes.create({ creator: user_id })
    else
      @curr_like.destroy
    end
    redirect_to post_path(@post)
  end

  private

  def require_login
    unless user_signed_in?
      redirect_to new_user_session_url,
                  flash: { notice: 'Вы должны войти в систему, чтобы получить доступ к этому действию!' }
    end
  end
end
