class Headhunter::ApplicationsController < ApplicationController
  before_action :authenticate_headhunter!
  
  def index
    @job = Job.find(params[:job_id])
    @applications = Application.all
  end
  

end
