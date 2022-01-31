# frozen_string_literal: true

# documentation comment for class CommentsController
class CommentsController < ApplicationController
  before_action :require_login

  def create
    data = { user: current_user }
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create data.merge!(comment_params)
    if @comment.errors.any?
      redirect_to post_path(@post), flash: { warning: @comment.errors.full_messages.join(' ') }
    else
      redirect_to post_path(@post), flash: { success: 'Ваш комментарий успешно добавлен! Аллаху акбар!' }
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end

  def require_login
    return if user_signed_in?

    redirect_to new_user_session_url,
                flash: { warning: 'Вы должны войти в систему, чтобы получить доступ к этому действию!' }
  end
end
