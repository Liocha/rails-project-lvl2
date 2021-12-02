# frozen_string_literal: true

# top-level documentation comment for class PostsController
class PostsController < ApplicationController
  before_action :require_login, only: %i[new create]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.post_comments.roots.reduce([]) do |acc, car|
      acc.concat(car.subtree.arrange_serializable)
    end
    @count_likes = @post.post_likes.all.count
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
end
