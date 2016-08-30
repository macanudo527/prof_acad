class AnswerSession < ActiveRecord::Base
  belongs_to :grouping
  belongs_to :user
  has_many   :user_answers
  has_many   :questions, through: :user_answers
  
  accepts_nested_attributes_for :user_answers,
    :allow_destroy => true,
    :reject_if     => :all_blank
  
   validate do |answer_session|
    error_msg = "Missing Answer for Questions "
    questions_with_errors = Array.new()
    count = 0
    answer_session.user_answers.each_with_index do |user_answer, index|
      next if user_answer.valid?
 #     user_answer.errors.full_messages.each do |msg|
        # you can customize the error message here:
        questions_with_errors.push(index+1)
        count++
        errors[:base] << "Missing Answer for Questions #{user_answer.question.question}"
 #     end
    end
    questions_with_errors.each_with_index do |questionno, index|
      if index < count - 2
        error_msg += questionno + ", "
      elsif index == count - 2
        error_msg += questionno
      else
        error_msg += " and " + questionno
      end
    end
    
  end
  
end

