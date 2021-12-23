# frozen_string_literal: true

# documentation comment for class CommentsController
class CommentsController < ApplicationController
  before_action :require_login

  def create
    data = { user: current_user }
    @post = Post.find(params[:post_id])
    if comment_params.include?(:parent_id)
      parrent_id = comment_params[:parent_id]
      PostComment.find(parrent_id).children.create data.merge!(comment_params, post_id: params[:post_id])
    else
      @comment = @post.comments.create data.merge!(comment_params)
    end

    redirect_to post_path(@post), flash: { danger: @comment.errors.full_messages }
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content)
  end

  def require_login
    return if user_signed_in?

    redirect_to new_user_session_url,
                flash: { warning: 'Вы должны войти в систему, чтобы получить доступ к этому действию!' }
  end
end
