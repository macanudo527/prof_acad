class QuestionsController < ApplicationController
  before_action :authenticate_user!
    
  def new
    @question = Question.new(question_params)
  end
  
  def create  
    @question = current_user.questions.build(question_params)
    @question.grouping = Grouping.find(params[:grouping_id])
    respond_to do |format|
      if @question.save
        flash[:success] = "Question Added!"
        format.html { redirect_to(@question.grouping) }
        format.xml  { render :xml => @question.grouping, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
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
  
  def destroy
    @question = Question.find(params[:id]).destroy
    flash[:success] = "Question deleted"
    redirect_to @question.grouping   
  end

  private

    def question_params
      params.require(:question).permit(:grouping_id, :id, :question, :correct_answer, :a2,
                                   :a3, :a4)
    end


  
end
