class User::AnswersController < ApplicationController
  before_action :authenticate_user!

  def show
    @answers = Comment.find(params[:comment_id])
  end

  def create
    @user = current_user
    @answer = Answer.new(params.require(:answer).permit(:user_id, :comment_id, :answer))
    if @answer.save
      flash[:success] = "Resposta enviada"
      redirect_to request.referer 
    end
  end
end