class UserAnswersController < ApplicationController
  before_action :authenticate_user!
  helper UserAnswerHelper

  def new
    @question = Question.find(params[:question_id])
    @user_answer = UserAnswer.new(:user => current_user, :question => @question) 
    answer_seq = (1..4).to_a.shuffle.take(4).join("").to_i
    @user_answer.update(answer_seq: answer_seq)
    @user_answer.save
  end
  
  def update
    @user_answer = UserAnswer.find(params[:id])
    @user_answer.user = current_user
    if @user_answer.update_attributes(user_answer_params)
      flash[:success] = "Answer successfully saved."
      redirect_to Question.find(params[:question_id])
    else
      render 'edit'
    end    
  end
 
  private
  
    def user_answer_params
      answer_array = @user_answer.answer_seq.to_s.split('').map { |digit| digit.to_i }
      real_answer = answer_array[params[:user_answer][:answer].to_i]
      params.require(:user_answer).permit(:question_id).merge(answer: real_answer)
    end 
  
end
