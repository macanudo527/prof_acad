class Share < ActiveRecord::Base
  belongs_to :question, class_name: "Question"
  belongs_to :grouping, class_name: "Grouping"
  validates :question, presence: true
  validates :grouping, presence: true
end
