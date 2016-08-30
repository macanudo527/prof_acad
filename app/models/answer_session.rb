class AnswerSession < ActiveRecord::Base
  belongs_to :grouping
  belongs_to :user
  has_many   :user_answers
  has_many   :questions, through: :user_answers
  
  accepts_nested_attributes_for :user_answers,
    :allow_destroy => true,
    :reject_if     => :all_blank
  
   validate do |answer_session|
    answer_session.user_answers.each do |user_answer|
      next if user_answer.valid?
      user_answer.errors.full_messages.each do |msg|
        # you can customize the error message here:
        errors[:base] << "Missing Answer for Question '#{user_answer.question.question}'"
      end
    end
  end
  
end
