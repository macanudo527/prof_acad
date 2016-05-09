class QuestionsController < ApplicationController
  
  def new
    @question_group = []
    20.times do
      @question_group << Question.new
    end
  end
  
  def create
 #   if params.has_key?("question")
  #    @question = Question.create(question_params(params))
 #   else 
      params["questions"].each do |question|
        # If the question is empty, we don't want to save it
        if !question_empty?(question) 
          @question = Question.create(question_params(question))
          @question.save
        end
      end
#    end
    flash[:success] = "Quiz made!"
    redirect_to root_url
    
  end
  
  private
    
    # Check if all question fields are filled out
    def question_empty?(question)
      if question["question"] != "" || question["a1"] != "" || 
          question["a2"] != "" || question["a3"] != "" ||
          question["a4"] != ""
          return false
      else
          return true
      end
    end
    
    def question_params(my_params)
      my_params.permit(:question, :a1, :a2, :a3, :a4)
    end
  
end
