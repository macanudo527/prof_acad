class AnswerSession < ActiveRecord::Base
  belongs_to :grouping
  belongs_to :user
  has_many   :user_answers
  has_many   :questions, through: :user_answers
  
  accepts_nested_attributes_for :user_answers,
    :allow_destroy => true,
    :reject_if     => :all_blank
  
  def correct_count
    count = 0
    user_answers.each do |question|
      if question.answer == "1"
        count += 1
      end
    end
    return count
  end
  
  
  validate do |answer_session|
    error_msg = "Please Answer Question(s) "
    questions_with_errors = Array.new()
    count = 0
    answer_session.user_answers.each_with_index do |user_answer, index|
      next if user_answer.valid?
        questions_with_errors.push(index+1)
        count += 1
    end
    questions_with_errors.each_with_index do |questionno, index|
      if index < count - 2
        error_msg += questionno.to_s + ", "
      elsif index == count - 2
        error_msg += questionno.to_s
      else
        error_msg += " and " + questionno.to_s
      end
    end
    
    if questions_with_errors.length > 0
      error_msg += " and click 'save answers' again."
      errors[:base] << error_msg      
    end

  end
  
end

