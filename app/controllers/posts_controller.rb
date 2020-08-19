class PostsController < ApplicationController
  def index
    @post = Post.all
    @none = Post.where(category_id: 1)
    @lifestyle = Post.where(category_id: 2)
    @work = Post.where(category_id: 3)
    @human = Post.where(category_id: 4)
    @other = Post.where(category_id: 5)

    @eachCategory = [@none, @lifestyle, @work, @human, @other]
  end

  def new
    @post = Post.new
  end

  def show
  end
  
  def create
    post = Post.new(posts_params)
    if post.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def posts_params
    params.require(:post).permit(:comment, :category_id).merge(user_id: current_user.id)
  end
end
