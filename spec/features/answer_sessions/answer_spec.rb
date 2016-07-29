require 'rails_helper'

RSpec.feature 'Answer a Grouping' do
 before {
   grouping = FactoryGirl.create(:grouping)
   2.times do
     question = FactoryGirl.create(:question)
     question.user = @user
     question.grouping = grouping
     question.save
   end
   visit new_grouping_answer_session_path(grouping.id)  
 } 
 
  
 scenario 'unauthenticated user' do
   expect(page.current_path).to eq new_user_session_path
 end 
 
 scenario 'Save all answers correctly' do
   
 end 
  
  
end
