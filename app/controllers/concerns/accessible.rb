module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  
  def check_user
    if current_headhunter
      flash.clear
      redirect_to(headhunter_session_path) and return
    elsif current_user
      flash.clear
      redirect_to(user_session_path) and return
    end
  end
end