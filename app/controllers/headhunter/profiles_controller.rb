class Headhunter::ProfilesController < ApplicationController
  before_action :authenticate_headhunter!

  def show
    @job = Job.find(params[:id])
    @user = Job.find(params[:id])
    @profile = Profile.find(params[:id])
    @comment = Comment.new()
    @comments = Comment.all
  end
  
end