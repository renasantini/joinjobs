class Headhunter::JobOffersController < ApplicationController
  
  def index
    @job_offers = JobOffer.all
  end

  def show
    @job_offer = JobOffer.find(params[:id])
  end
  
  def new
    @profile = Profile.find(params[:profile_id])
    @headhunter = current_headhunter
    @job_offer = JobOffer.new()
  end
  
  def create
    @headhunter = current_headhunter
    @profile = Profile.find(params[:profile_id])
    @job_offer = JobOffer.new(job_offer_params)
    if @job_offer.save
      flash[:success] = "Proposta enviada com sucesso"
      redirect_to headhunter_job_offer_path(@job_offer.id)
    else
      render 'new' 
    end
  end

  private

  def job_offer_params
    params.require(:job_offer).permit(:headhunter_id, :profile_id, :message, 
                                      :title, :role, :wage, :benefits, 
                                      :expectations, :start_date)
  end
end