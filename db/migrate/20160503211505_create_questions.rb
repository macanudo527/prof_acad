class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :a1
      t.string :a2
      t.string :a3
      t.string :a4
      t.integer :reference
      t.integer :reference_type
      t.references :question_type, index: true, foreign_key: true
      t.integer :correct
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
