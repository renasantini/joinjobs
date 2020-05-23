class Headhunter::CommentsController < ApplicationController
  
  def show
    @comments = Comment.find(params[:profile_id])
  end


  def create
    @headhunter = current_headhunter
    @comment = Comment.new(params.require(:comment).permit(:headhunter_id, :profile_id, :message))
    if @comment.save
      flash[:success] = "Comentário enviado"
      redirect_to request.referer 
    end
  end
end