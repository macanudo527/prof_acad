class ChangeQuestionTypeIdInQuestions < ActiveRecord::Migration
  def change
        change_table :questions do |t|
          t.rename :question_type_id, :question_type
        end
        add_reference :questions, :question_type, index:true, foreign_key: true
  end
end
