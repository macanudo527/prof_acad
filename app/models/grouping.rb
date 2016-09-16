class Grouping < ActiveRecord::Base
  belongs_to :test
  belongs_to :user
  has_many :answer_sessions
  acts_as_taggable
  
  
  accepts_nested_attributes_for :questions,
    :allow_destroy => true,
    :reject_if     => :all_blank
    
  validates_presence_of :name
end
