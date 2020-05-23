class Headhunter::ApplicationsController < ApplicationController
  
  def index
    @job = Job.find(params[:job_id])
    @applications = Application.all
  end
  

end
