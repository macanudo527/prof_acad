class UserAnswerController < ApplicationController
  before_action :authenticate_user!

  def new
    @question = Question.find(params[:id])
    @user_answer = User_answer.new(:user => current_user, :question => @question) 
  end
  
  
  
end
