require 'test_helper'

class CreateQuestionsTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:cookie)
  end
  

  test "should save the right amount of questions" do 
    post user_session_path, :user => {:email => @user.email, :password =>  @user.password} 
    get new_question_path
    assert_difference 'Question.count', 1 do
      post questions_path, {"questions" => [{"question" => "What is 1+1?",
                           "a1" => "0", "a2" => "1", "a3" => "2", "a4" => "3"}]} 
    end
    assert_difference 'Question.count', 2 do
      post questions_path, { "questions" => [{"question" => "What is 1+1?",
                           "a1" => "0", "a2" => "1", "a3" => "2", "a4" => "3"}, 
                           {"question" => "What is 1 - 1?", "a1" => "1",
                           "a2" => "0", "a3" => "2", "a4" => "3"}]} 
    end
  end 
 
end
