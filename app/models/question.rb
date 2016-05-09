class Question < ActiveRecord::Base
  belongs_to :grouping
  belongs_to :question_type
  belongs_to :question_assignment 
  belongs_to :user 
  
  
end
