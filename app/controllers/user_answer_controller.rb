class UserAnswerController < ApplicationController
  before_action :authenticate_user!

  def new
    @user_answer = Grouping.find(params[:id])  
  end
  
  
  
end
