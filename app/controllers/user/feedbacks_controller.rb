class User::FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def index
    @feedbacks = Feedback.all
  end

  def show
    @feedbacks = Feedback.find(:id)
  end
  
end