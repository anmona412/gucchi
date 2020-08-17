class ProfilesController < ApplicationController
def new
end

def create
  profile = Profile.create(profile_params)
  binding.pry
  if profile.save
    redirect_to root_path
  else
    render "new"
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