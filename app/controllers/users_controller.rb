class UsersController < ApplicationController
  def index
    @user = current_user
  end
  def show
    @profile =Profile.new
  end
  def new
    
  end

  def create
  end


end
