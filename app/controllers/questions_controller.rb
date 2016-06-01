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

  
end
