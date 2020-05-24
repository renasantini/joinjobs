class Headhunter::FeedbacksController < ApplicationController
  

  def index
    @feedbacks = Feedback.all
  end

  def new
    @job = Job.find(params[:job_id])
    @profile = Profile.find(params[:profile_id])
    @feedback = Feedback.new()
    @headhunter = current_headhunter
  end
  
  def create
    @job = Job.find(params[:job_id])
    @headhunter = current_headhunter
    @profile = Profile.find(params[:profile_id])
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      flash[:success] = "Perfil rejeitado e feedback enviado com sucesso"
      redirect_to headhunter_feedbacks_path
    else
      render 'new' 
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:headhunter_id, :profile_id, :feedback, :job_id)
  end
end