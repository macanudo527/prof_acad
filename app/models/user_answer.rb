class UserAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :answer_session
  
  scope :for_question_user, ->(_question, _user) { where(question: _question, user: _user) }
  
end
