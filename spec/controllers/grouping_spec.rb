require "rails_helper"

RSpec.describe GroupingsController do
  login_user
  
  describe "POST #new" do 
    
  it "doesn't save blank questions" do
    get :new
    expect {
      @grouping = Grouping.new(name: "")
      @grouping.questions = Question.new(question: "", correct_answer: "", a2: "", a3: "", a4: "")
      @grouping.create!
#      post groupings_path, { "grouping" => { name: "", "question_attributes" => "" }}
    }.to_not change{Question.count} 
  end
    
    
    
    
    
  end
  
  
  
end