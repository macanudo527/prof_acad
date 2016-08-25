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
      
      # change the user's answer into the real answer based on the answer sequence
      params[:answer_session][:user_answers_attributes].each do |user_answer|
        # retrieve the user answer we saved earlier
        answer_seq = UserAnswer.find(user_answer[1][:id]).answer_seq
        # convert it into an array for easy manipulation
        answer_array = answer_seq.to_s.split('').map { |digit| digit.to_i }
        # translate user's answer to real answer
        real_answer = answer_array[user_answer[1][:answer].to_i]     
        # merge the real answer into the permitted params   
        filtered_params[:user_answers_attributes][user_answer[0]].merge!(answer: real_answer)
      end

      # re-permit the params since we added to them
      filtered_params.permit!

    end 

end

