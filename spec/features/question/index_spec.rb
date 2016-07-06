require 'rails_helper'

RSpec.feature 'Question list' do
 before {visit questions_path}
  
 scenario 'unauthenticated user' do
   expect(page.current_path).to eq new_user_session_path
 end
 
 scenario 'authenticated user without questions', :login => :true do
   expect(page).to have_text("New Question")
 end
 
 scenario 'authenticated user with questions', :login => :true do
   question = FactoryGirl.create(:question)
   question.user = @user
   question.save
   visit questions_path
   expect(page).to have_text("Available Questions")
   visit user_questions_path(@user)
   expect(page).to_not have_text("Available Questions")
   expect(page).to have_text(question.question)
 end
 
 

end
