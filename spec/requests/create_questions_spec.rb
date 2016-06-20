require "rails_helper"

RSpec.describe "Save questions" do
  
  before(:each) do
    @user = Factory.build(:user)
  end
  
  it "doesn't save blank questions" do
    get new_grouping_path
  end  
end
