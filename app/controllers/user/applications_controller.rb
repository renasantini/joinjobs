class User::ApplicationsController < ApplicationController
  
  def index
    @user = current_user
    @applications = current_user.applications
  end
  
  def new
    @application = Application.new
  end
  
  def create
    @job = Job.find(params[:job_id])
    @user = current_user
    @application = Application.new(application_params)
    @application.user = @user
    @application.job = @job
    if @application.save
      flash[:success] = "Candidatura confirmada"
      redirect_to user_applications_path
    else
      render 'new'
    end
  end
  
  private

    def application_params
      params.require(:application).permit(:job_id, :user_id)
    end
  
end
