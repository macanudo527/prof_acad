require "rails_helper"

RSpec.describe GroupingsController do
  login_user
  
  describe "POST #new" do 
    
  it "doesn't save blank questions" do
    get :new
    expect {
      @grouping = Grouping.new(name: "")
      @grouping.questions.build(question: "", correct_answer: "", a2: "", a3: "", a4: "")
      @grouping.save
#      post groupings_path, { "grouping" => { name: "", "question_attributes" => "" }}
    }.to_not change{Question.count} 

    @one_question =  [{question: "What is 1+1?", correct_answer: "0", a2: "1", a3: "2", a4: "3"},
                      {question: "", correct_answer: "", a2: "", a3: "", a4: ""}]
    
     expect {
      @grouping = subject.current_user.groupings.build(@one_question)
      @grouping.questions.each do |question|
        question.user = subject.current_user      
      end
      @grouping.save
#      post groupings_path, { "grouping" => { name: "", "question_attributes" => "" }}
    }.to change{Question.count}.by(1)    
    
  end
    
  def grouping_params
 #   params.require(:grouping).permit(:name, questions_attributes: [:id, :grouping_id, :user_id, :question, :correct_answer, :a2, :a3, :a4])
  end
    
    
    
  end
  
  
  
end