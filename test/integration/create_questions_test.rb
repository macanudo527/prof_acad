require 'test_helper'

class CreateQuestionsTest < ActionDispatch::IntegrationTest
    
  def setup
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    @david.confirm 
  end
  
 
  test "should save the right amount of questions" do 
    
    post user_session_path, 'user[email]' => @david.email, 'user[password]' =>  @david.password 
    get new_grouping_path 
    
    # Invalid submission
    assert_no_difference 'Question.count' do
      post groupings_path, { "grouping" => { name: "", "question_attributes" => "" }}
    end
    assert_select 'div#error_explanation'
    
    # Test with one question filled out, and second one blank
    @one_question =  [{question: "What is 1+1?", correct_answer: "0", a2: "1", a3: "2", a4: "3"},
                      {question: "", correct_answer: "", a2: "", a3: "", a4: ""}]
    assert_difference 'Question.count', 1 do
      post groupings_path, {"grouping" => {name: "one question", "questions_attributes" => @one_question}}
    end
    
    # Test with just two questions filled out
    @two_questions = [{question: "What is 1+1?", correct_answer: "0", a2: "1", a3: "2", a4: "3"},
                      {question: "What is 1-1?", correct_answer: "1", a2: "0", a3: "2", a4: "3"}]    
    assert_difference 'Question.count', 2 do
      post groupings_path, {"grouping" => {name: "two questions", "questions_attributes" => @two_questions}}
    end    
    follow_redirect!
    assert_match "What is 1+1?", response.body
    
    # Delete a question
    assert_select 'a', text: 'delete'
    first_question = @david.questions.find_by(question: "What is 1+1?")
    assert_difference 'Question.count', -1 do
      delete question_path(first_question)
    end
            
    
  end 
 
end
