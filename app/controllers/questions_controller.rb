class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,    only: [:edit, :update, :destroy] 
  helper UserAnswerHelper
      
  def new
    @question = current_user.questions.new
    
    if params[:question][:grouping_id].present?
      @question.grouping = Grouping.find(params[:question][:grouping_id])      
    end
  end
  
  def create  
    @question = current_user.questions.build(question_params)
    byebug
    if params[:question][:grouping_id].present?
      @question.grouping = Grouping.find(params[:grouping_id])      
    end
    respond_to do |format|
      if @question.save
        flash[:success] = "Question Added!"
        format.html { redirect_to(@question) }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @question = Question.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
    end
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:success] = "Question successfully updated."
      redirect_to @question
    else
      render 'edit'
    end
  end
  
  def index
    @questions = params[:user_id] ? 
      User.find(params[:user_id]).questions.paginate(page: params[:page]) : 
      params[:grouping_id] ?
      Grouping.find(params[:grouping_id]).questions.paginate(page: params[:page]) : 
      Question.paginate(page: params[:page])
    if @questions.count < 1
      @question = current_user.questions.new
      render 'new'
    end
  end
  
  def destroy
    @question = Question.find(params[:id]).destroy
    flash[:success] = "Question deleted"
    if params[:grouping_id]
      redirect_to user_grouping_path(current_user, Grouping.find(params[:grouping_id]))
    else
      redirect_to user_questions_path(current_user)
    end   
  end

  private

    def question_params
      params.require(:question).permit(:grouping_id, :id, :question, :correct_answer, :a2,
                                   :a3, :a4)
    end

    # Confirms the correct user.
    def correct_user
      @question = Question.find(params[:id])
      redirect_to(root_url) unless current_user == @question.user
    end

  
end

