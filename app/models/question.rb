class Question < ActiveRecord::Base
  belongs_to :grouping
  belongs_to :question_type
  belongs_to :user 
  
  validates_presence_of :question, :correct_answer, :a2, :a3, :a4
end
