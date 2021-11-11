# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
#    logger.debug "!!!Params #{@post.post_comments}"
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator_id = current_user.id
    if @post.save
      redirect_to root_url, flash: { success: 'Новая статья успешно добавлена!' }
    else
      render :new
    end
  end

  private

  def post_params
    params[:post].permit!
  end
end
