# frozen_string_literal: true

# top-level documentation comment for class PostsController
class PostsController < ApplicationController
  before_action :require_login, only: %i[new create]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = children_with_descendants(@post.comments.roots.ids)
    @like_from_current_user = @post.likes.find_by(user_id: current_user)
    @count_likes = @post.likes.all.count
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

  def require_login
    return if user_signed_in?

    redirect_to new_user_session_url,
                flash: { notice: 'Вы должны войти в систему, чтобы получить доступ к этому действию!' }
  end

  def children_with_descendants(child_ids)
    query = child_ids.map do |child_id|
      "(post_comments.id = '#{child_id}' OR post_comments.ancestry LIKE '%#{child_id}%')"
    end.join(' OR ')
    PostComment.where(query)
  end
end
