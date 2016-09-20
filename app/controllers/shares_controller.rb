class SharesController < ApplicationController
  
  def create
    grouping = Grouping.find(params[:grouping_id])
    grouping.addQuestionId(params[:question_id])
    render grouping(params[:grouping_id])
  end
  
  
  
end
