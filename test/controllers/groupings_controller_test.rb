require 'test_helper'

class GroupingsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_redirected_to user_session_path
  end
  
  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to user_session_path
  end

end
