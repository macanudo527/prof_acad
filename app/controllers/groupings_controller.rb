class GroupingsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,    only: [:edit, :update] 
 
  def new
    @grouping = current_user.Grouping.new
  end
  
  def new_question
    @question = @grouping.Question.new
    render new_question_path(@question)
  end
  
 def create
    @grouping = current_user.Grouping.new(grouping_params)
    respond_to do |format|
      if @grouping.save
        flash[:success] = "Quiz Made!"
        format.html { redirect_to(@grouping) }
        format.xml  { render :xml => @grouping, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @groping.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @grouping = Grouping.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def destroy
    @grouping = Grouping.find(params[:id])
    @grouping.destroy

    respond_to do |format|
      format.html { redirect_to(groupings_url) }
      format.xml  { head :ok }
    end
  end
  
  def edit
    @grouping = Grouping.find(params[:id])
  end
  
  def index
    @groupings = current_user.groupings.paginate(page: params[:page])    
  end
  
  def update
    if @grouping.update_attributes(grouping_params)
      flash[:success] = "Quiz updated"
      redirect_to @grouping
    else
      render 'edit'
    end
  end
  
  private
  
    def grouping_params
      params.require(:grouping).permit(:name, questions_attributes: [:id, :grouping_id, :question, :correct_answer, :a2, :a3, :a4])
    end
    
    # Confirms the correct user.
    def correct_user
      @grouping = Grouping.find(params[:id])
      redirect_to(root_url) unless current_user == @grouping.user
    end

  
end
