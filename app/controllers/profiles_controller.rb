class ProfilesController < ApplicationController
  before_action :profile, only: [:show, :update, :edit]

def new
end

def show
  
end

def create
  profile = Profile.create(profile_params)
  if profile.save
    redirect_to root_path
  else
    render "new"
  end
end

def edit
  @user = User.find(params[:id])
end

def update
  binding.pry
  if @profile.update(update_params)
    redirect_to root_path
  else
    render "edit"
  end
    

end

private
  def check_user
    @user = User.find(params[:id])
  end
end

def profile_params
  params.permit(:user_id, :age_id, :profession_id)
end


def update_params
  params.require(:profile).permit(:user_id, :age_id, :profession_id)
end

def profile
  @profile =Profile.find_by(user_id: current_user.id)
end