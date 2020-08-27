class UsersController < ApplicationController
  def index
    @user = current_user
  end
  def show
    @user = User.find(params[:id])
    @profile =Profile.find_by(user_id: current_user.id)
    @p_exist =Profile.where(user_id: current_user.id).exists?
    @post = Post.where(user_id: current_user.id)
  end

  def new
  end

  def create
  end

  def destroy
    
  end
end
