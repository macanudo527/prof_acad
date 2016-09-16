class Grouping < ActiveRecord::Base
  belongs_to :test
  belongs_to :user
  has_many :answer_sessions
  acts_as_taggable
  
  has_many   :question_shares, class_name: "Share",
                        foreign_key: "question_id",
                        dependent:   :destroy
  has_many   :questions, through: :question_shares, source: :question_id
  
  def addQuestion(question)
    question_shares.create(question_id: question.id)
  end
  
  def deleteQuestion(question)
    question_shares.find_by(question_id: question.id).destroy
  end
  
  accepts_nested_attributes_for :questions,
    :allow_destroy => true,
    :reject_if     => :all_blank
    
  validates_presence_of :name
end
