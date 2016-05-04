class QuestionAssignment < ActiveRecord::Base
  belongs_to :question
  belongs_to :grouping
end
