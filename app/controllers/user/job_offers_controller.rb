class User::JobOffersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @job_offers = JobOffer.all
  end

  def show
    @job_offer = JobOffer.find(params[:id])
  end

  def edit
    @job_offer = JobOffer.find(params[:id])
  end
  
  def update
    @job_offer = JobOffer.find(params[:id])
    @job_offer.update(job_offer_answer_params)
    flash[:success] = "Resposta enviada com sucesso"
    redirect_to user_job_offer_path(@job_offer.id)
  end

  private

  def job_offer_answer_params
    params.require(:job_offer).permit(:status, :confirm_start)
  end
end

