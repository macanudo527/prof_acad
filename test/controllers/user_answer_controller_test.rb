require 'test_helper'

class UserAnswerControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_redirected_to user_session_path
  end

end
