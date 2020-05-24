class User::FeedbacksController < ApplicationController
  

  def index
    @feedbacks = Feedback.all
  end

  def show
    @feedbacks = Feedback.find(:id)
  end
  
end