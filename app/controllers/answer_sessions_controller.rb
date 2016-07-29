class AnswerSessionsController < ApplicationController
  before_action :authenticate_user!
  helper UserAnswerHelper

  def new
      @grouping = Grouping.find(params[:grouping_id])
      @answer_session = AnswerSession.new(:user => current_user, 
                :grouping => @grouping)
      @grouping.questions.each do |question| 
        answer_seq = (1..4).to_a.shuffle.take(4).join("").to_i        
        question.user_answers.build(:user => current_user, 
                :answer_seq => answer_seq,
                :answer_session => @answer_session).save
      end       
  end
  
  def update
    @answer_session = AnswerSession.find(params[:id])
    @answer_session.user = current_user
    if @answer_session.update_attributes(answer_session_params)
      flash[:success] = "Answer successfully saved."
      redirect_to Grouping.find(params[:grouping_id])
    else
      render 'edit'
    end     
  end
  
  private
  
  
    def answer_session_params
      
      filtered_params = params.require(:answer_session)
                        .permit([user_answers_attributes: [:question_id, :answer, :id]])                      
      
      params[:answer_session][:user_answers_attributes].each do |user_answer|
        answer_seq = UserAnswer.find_by(user_answer[1][:id]).answer_seq
        answer_array = answer_seq.to_s.split('').map { |digit| digit.to_i }
        real_answer = answer_array[user_answer[1][:answer].to_i]        
        filtered_params[:user_answers_attributes][user_answer[0]].merge!(answer: real_answer)
      end

      # This marks the newly added parameters as permitted.  It's only necessary because we
      # made new Hashes when we modified the "pseudo-array"
      filtered_params.permit!
      
  #    answer_array = @user_answer.answer_seq.to_s.split('').map { |digit| digit.to_i }
  #    real_answer = answer_array[params[:user_answer][:answer].to_i]
  #    params.require(:answer_session).permit(:question_id).merge(answer: real_answer)
    end 

end

