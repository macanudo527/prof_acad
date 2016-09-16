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
      if question.answer == 1
        count += 1
      end
    end
    return count
  end
  
  def incorrect_answers
    incorrect_answers = Array.new
    user_answers.each do |question|
      if question.answer != 1
        incorrect_answers << question
      end
    end
    return incorrect_answers
  end
  
# Bubble up error msgs from user_answers to answer_session  
  validate do |answer_session|
    error_msg = "Please Answer Question(s) "
    questions_with_errors = Array.new()
    count = 0
    answer_session.user_answers.each_with_index do |user_answer, index|
      next if user_answer.valid?
        questions_with_errors.push(index+1)
        count += 1
    end
    error_msg += questions_with_errors.to_sentence
    
    if questions_with_errors.length > 0
      error_msg += " and click 'save answers' again."
      errors[:base] << error_msg      
    end

  end
  
end

