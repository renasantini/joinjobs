class ProfilesController < ApplicationController
  def index
  end

  def show
    @profile = Profile.find(params[:id])
  end
  
  def new
    @profile = Profile.new
    @user = current_user
  end
  
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      flash[:success] = "Perfil criado com sucesso"
      redirect_to users_profile_path @profile
    else
      render 'new'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:full_name, :name, :birth_date, :document,
                                    :graduation, :university, :description, 
                                    :experience, :picture, :resume, :user_id)
  end
end