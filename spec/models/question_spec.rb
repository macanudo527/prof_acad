require 'rails_helper'

RSpec.describe Question do
  subject {Question.new}  
  
  it "is not valid without question" do
    expect(subject).not_to be_valid
  end
  
  it "is not valid without answers" do
    subject.question = "What does love have to do with it?"
    expect(subject).not_to be_valid
  end
  
  it "is not valid with blank answers" do
    subject.attributes = {question: "What is the meaning of life?", 
        correct_answer: "", a2: "", a3: "", a4: ""}
    expect(subject).not_to be_valid
  end
  
end
