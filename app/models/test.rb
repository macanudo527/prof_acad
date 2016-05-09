class Test < ActiveRecord::Base
  belongs_to :user
  has_many :groupings
  validates :user_id, presence: true
  validates :name, presence: true

  
end
