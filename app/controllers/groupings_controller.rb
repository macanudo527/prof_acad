class GroupingsController < ApplicationController
  
  def new
    @grouping = Grouping.new
  end
  
 def create
    @grouping = Grouping.new(grouping_params)

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
  
  private
  
    def grouping_params
      params.require(:grouping).permit(:name, questions_attributes: [:id, :grouping_id, :question, :correct_answer, :a2, :a3, :a4])
    end

  
end
