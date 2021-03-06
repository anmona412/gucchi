class PostsController < ApplicationController
  before_action :post, only:[:show, :edit, :update, :destroy]
  def index
    @post = Post.includes(:user).order(created_at: :desc)
    @none = Post.where(category_id: 1)
    @label_id = [
      {id: "lifestyle", name: "生活"},
      {id: "work", name: "仕事"},
      {id: "human", name: "人間関係"},
      {id: "other", name: "その他"}
    ]
    @post_box =[
      {id: "all-posts", category: @post},
      {id: "lifestyle-posts", category: Post.where(category_id: 2).order(created_at: :desc)},
      {id: "work-posts", category: Post.where(category_id: 3).order(created_at: :desc)},
      {id: "human-posts", category: Post.where(category_id: 4).order(created_at: :desc)},
      {id: "other-posts", category: Post.where(category_id: 5).order(created_at: :desc)}
    ]
    @mk_post = PostsTag.new

  end

  def new
  end

  def show
  end
  
  def create
    redirect_to user_session_path unless user_signed_in?
    post = PostsTag.new(posts_params)
    if post.valid?
      post.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    binding.pry
    @post_form = PostsTag.new(
      user_id: @post.user.id,
      comment: @post.comment,
      category_id: @post.category_id,
      name:@post.tags.name,
      # post_id:@post.post_tag_relations.post,
      # tag_id:@post.post_tag_relations.tag,
    )
  end

  def update
    post = PostsTag.update(posts_params)
    if post.update(posts_params)
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

  def search
    if params[:keyword] == ""
      redirect_to "/"
    end
    @post = Post.search(params[:keyword])
    
    # return nil if params[:input] == ""
    # tag = Tag.where(['name LIKE ?', "%#{params[:input]}%"] )
    # render json:{ keyword: tag }
  end

  private

  def posts_params
    params.require(:posts_tag).permit(:comment, :category_id, :name).merge(user_id: current_user.id)
  end

  def post
    @post = Post.find(params[:id])
  end

end
