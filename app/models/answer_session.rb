class AnswerSession < ActiveRecord::Base
  belongs_to :grouping
  belongs_to :user
  has_many   :user_answers
  has_many   :questions, through: :user_answers
  
  accepts_nested_attributes_for :user_answers,
    :allow_destroy => true,
    :reject_if     => :all_blank
    
  validates_associated_bubbling :user_answers
  
end
