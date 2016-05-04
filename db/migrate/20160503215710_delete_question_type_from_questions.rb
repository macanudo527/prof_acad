class DeleteQuestionTypeFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :question_type_id, :integer
  end
end
