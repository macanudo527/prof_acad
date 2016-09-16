class Question < ActiveRecord::Base
  belongs_to :question_type
  belongs_to :user
  has_many   :user_answers 
  has_many   :grouping_shares, class_name: "Share",
                        foreign_key: "question_id",
                        dependent:   :destroy
  has_many   :groupings, through: :grouping_shares, source: :grouping_id
  
  validates_presence_of :question, :correct_answer, :a2, :a3, :a4
  validates :question, uniqueness: true
end
