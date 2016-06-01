class AddGroupingToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :grouping, index: true, foreign_key: true
  end
end
