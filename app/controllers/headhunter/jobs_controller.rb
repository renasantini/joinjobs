  class Headhunter::JobsController < ApplicationController

    def index
      @jobs = Job.all
    end

    def show
      @job = Job.find(params[:id])
    end

    def new
      @headhunters = Headhunter.all
      @job = Job.new
    end

    def create
      @job = Job.new(job_params)
      @job.headhunter = current_headhunter
      if @job.save
        flash[:success] = "Vaga criada com sucesso"
        redirect_to headhunter_job_path @job
      else
        render 'new'
      end
    end

    private

    def job_params
      params.require(:job).permit(:title, :description, :skills, :wage_range,
                                        :level, :limit_date, :location, :company,
                                         :headhunter_id)
    end
  end
