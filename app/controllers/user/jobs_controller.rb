class User::JobsController < ApplicationController
  
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end
  
  def search
    @jobs = Job.where('title like ? OR description like ? OR skills like?',
                      "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :skills, :wage_range,
                                      :level, :limit_date, :location, :company)
  end
end