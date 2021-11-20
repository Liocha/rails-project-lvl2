# frozen_string_literal: true

class PostCommentsController < ApplicationController
  def create
    data = {commenter: current_user[:id]}
    @post = Post.find(params[:post_id])
    if comment_params.include?(:parent_id)
      parrent_id = comment_params[:parent_id]
      PostComment.find(parrent_id).children.create data.merge!(comment_params, {post_id: params[:post_id]})
    else
      @comment = @post.post_comments.create! data.merge!(comment_params)
    end
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params[:post_comment].permit!
  end
end
