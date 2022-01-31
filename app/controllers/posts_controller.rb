# frozen_string_literal: true

# top-level documentation comment for class PostsController
class PostsController < ApplicationController
  before_action :require_login, only: %i[new create]

  def index
    @posts = Post.all.includes(:creator).page params[:page]
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.children_with_descendants(@post.comments.roots.ids).includes(:user).arrange_serializable do |parent, children|
      {
        id: parent.id,
        content: parent.content,
        creator_email: parent.user.email,
        children: children,
        parent: parent
      }
    end
    @like_from_current_user = @post.likes.find_by(user_id: current_user)
    @count_likes = @post.post_likes_count
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_url, flash: { success: 'Новая статья успешно добавлена!' }
    else
      render :new
    end
  end

  private

  def post_params
    params[:post].permit(:title, :body, :post_category_id)
  end

  def require_login
    return if user_signed_in?

    redirect_to new_user_session_url,
                flash: { notice: 'Вы должны войти в систему, чтобы получить доступ к этому действию!' }
  end
end
