require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  def setup
  end


  test "create should require logged-in user" do
    assert_no_difference 'Question.count' do
      post :create
    end
    assert_redirected_to user_session_path 
  end
  
  test "destroy should require logged-in user" do
    assert_no_difference 'Question.count' do
      delete :destroy, id: questions(:one)
    end
    assert_redirected_to user_session_path
  end

end
