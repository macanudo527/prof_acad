class CreateQuestionAssignments < ActiveRecord::Migration
  def change
    create_table :question_assignments do |t|
      t.references :question, index: true, foreign_key: true
      t.references :grouping, index: true, foreign_key: true
      t.integer :order

      t.timestamps null: false
    end
  end
end
