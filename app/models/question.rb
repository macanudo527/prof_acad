class Question < ActiveRecord::Base
  belongs_to :question_type
  belongs_to :user
  has_many   :user_answers 
  has_many   :grouping_shares, class_name: "Share",
                        foreign_key: "question_id",
                        dependent:   :destroy
  has_many   :groupings, through: :grouping_shares, source: :grouping
  
  validates_presence_of :question, :correct_answer, :a2, :a3, :a4
  validates :question, uniqueness: true
  
  def self.notInGroup(grouping_id) 
    includes(:grouping_shares).where('shares.id IS NULL OR shares.grouping_id != ?', grouping_id).references(:shares)
  end

  def addGrouping(grouping)
    grouping_shares.create(grouping_id: grouping.id)
  end
  
  def deleteGrouping(grouping)
    grouping_shares.find_by(grouping_id: grouping.id).destroy
  end

  def grouping_list
    grouping_names = groupings.map(&:name)
    grouping_names.to_sentence 
  end
  

end
