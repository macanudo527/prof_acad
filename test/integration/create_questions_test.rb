require 'test_helper'

class CreateQuestionsTest < ActionDispatch::IntegrationTest
  
  def setup
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    @david.confirm 
  end
  
 
  test "should save the right amount of questions" do 
    post user_session_path, 'user[email]' => @david.email, 'user[password]' =>  @david.password
    get new_grouping_path 
    
    #Testing with one question filled out, and second one blank
    @one_question =  [{question: "What is 1+1?", correct_answer: "0", a2: "1", a3: "2", a4: "3"},
                      {question: "", correct_answer: "", a2: "", a3: "", a4: ""}]
    assert_difference 'Question.count', 1 do
      post groupings_path, {"grouping" => {name: "one question", "questions_attributes" => @one_question}}
    end
    
    #Testing with just two questions filled out
    @two_questions = [{question: "What is 1+1?", correct_answer: "0", a2: "1", a3: "2", a4: "3"},
                      {question: "What is 1-1?", correct_answer: "1", a2: "0", a3: "2", a4: "3"}]    
    assert_difference 'Question.count', 2 do
      post groupings_path, {"grouping" => {name: "two questions", "questions_attributes" => @two_questions}}
    end 
  end 
 
end
