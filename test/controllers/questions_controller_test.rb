require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  def setup
    @user = users(:cookie) 
  end


  test "should have form for 20 questions" do
#    get :new
#    assert_response :success
    # Do inputs exist for 20 questions?
#    assert_select "label", {count: 20, text: "Answer 1"}
  end

end
