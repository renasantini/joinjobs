class Headhunter::FavoritesController < ApplicationController
  

  def index
    @favorites = Favorite.all
  end

  def new
    @profile = Profile.find(params[:profile_id])
    @favorite = Favorite.new()
    @headhunter = current_headhunter
  end
  
  def create
    @headhunter = current_headhunter
    @profile = Profile.find(params[:profile_id])
    @favorite = Favorite.new(favorites_params)
    if @favorite.save
      flash[:success] = "Perfil adicionado aos favoritos"
      redirect_to headhunter_favorites_path
    else
      render 'new' 
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    flash[:notice] = 'Perfil removido dos destacados com sucesso'
    redirect_to headhunter_favorites_path
  end

  private

  def favorites_params
    params.require(:favorite).permit(:headhunter_id, :profile_id, :observations)
  end
end