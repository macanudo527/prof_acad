class RemoveQuestionTypeFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :question_type, :integer
  end
end
