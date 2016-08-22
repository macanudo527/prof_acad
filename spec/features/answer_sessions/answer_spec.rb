require 'rails_helper'

RSpec.feature 'Answer a Grouping' do
 before {
   @grouping = FactoryGirl.create(:grouping)
   11.times do
     question = FactoryGirl.create(:question)
     question.user = @user
     question.grouping = @grouping
     question.save
   end
   visit new_grouping_answer_session_path(@grouping.id)  
 } 
 
  
 scenario 'unauthenticated user' do
   expect(page.current_path).to eq new_user_session_path
 end 
 
 scenario 'can\'t save unless you answer all questions with javascript', :login => true, :js => true do
    click_button('Next')
    sleep 1
    click_button('Next')
    sleep 1
    page.accept_alert "You didn't answer" do
      click_button('Save Answers')
    end
    expect(page.current_path).to_not eq grouping_path(@grouping) 
 end
 
 scenario 'can\'t save unless you answer all questions without javascript', :login => true do
    click_button('Save Answers')

 end  
  
  
end
