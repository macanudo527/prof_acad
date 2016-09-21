class SharesController < ApplicationController
  
  def create
    grouping = Grouping.find(params[:grouping_id])
    grouping.addQuestionId(params[:question_id])
    redirect_to Grouping.find(params[:grouping_id])
  end
  
  
  
  
end
