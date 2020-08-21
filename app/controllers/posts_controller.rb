class PostsController < ApplicationController
  before_action :post, only:[:show, :edit, :update, :destroy]

  def index
    @post = Post.includes(:user).order(created_at: :desc)
    @none = Post.where(category_id: 1)
    @lifestyle = Post.where(category_id: 2)
    @work = Post.where(category_id: 3)
    @human = Post.where(category_id: 4)
    @other = Post.where(category_id: 5)
    @eachCategory = [@none, @lifestyle, @work, @human, @other]
  end

  def new
    @post = PostsTag.new
  end

  def show
  end
  
  def create
    post = PostsTag.new(posts_params)
    if post.valid?
      post.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @post.update(posts_params)
      redirect_to post_path
    else
      render "edit"
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render "show"
    end
  end
  private

  def posts_params
    params.require(:posts_tag).permit(:comment, :category_id, :name).merge(user_id: current_user.id)
  end

  def post
    @post = Post.find(params[:id])
  end
end
