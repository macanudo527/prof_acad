class Question < ActiveRecord::Base
  belongs_to :grouping
  belongs_to :question_type
  belongs_to :user 
  
  validates_presence_of :question
end
