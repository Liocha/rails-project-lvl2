# frozen_string_literal: true

class PostCommentsController < ApplicationController
  def create
 #   if params[:post_comment].include?(:parent_id)
 #     parrent_id = params[:post_comment][:parent_id]
     # logger.debug "!!!Params #{params[:post_comment][:parent_id]}"
 #    PostComment.find(parrent_id).children.create comment_params
 #   else
    logger.debug "!!!Params #{params}"
      @post = Post.find(params[:post_id])
      @comment = @post.post_comments.create!(comment_params)
  #  end
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params[:post_comment].permit!
  end
end
