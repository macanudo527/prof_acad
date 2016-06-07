class QuestionsController < ApplicationController

    
  def new
  end
  
  def create  
  end
  
  def show
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:success] = "Question successfully updated."
      redirect_to @question.grouping
    else
      render 'edit'
    end
  end

  private

    def question_params
      params.require(:question).permit(:question, :correct_answer, :a1,
                                   :a2, :a3)
    end


  
end
