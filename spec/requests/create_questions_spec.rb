require "rails_helper"

RSpec.describe "Save questions" do
  
  before(:each) do 
    @user = FactoryGirl.build(:user)
  end
  
  it "doesn't save blank questions" do
    get new_grouping_path
    expect {
      post groupings_path, { "grouping" => { name: "", "question_attributes" => "" }}
    }.to_not change{Question.count} 
     
  end  
end
