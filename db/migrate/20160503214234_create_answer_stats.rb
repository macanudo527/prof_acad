class CreateAnswerStats < ActiveRecord::Migration
  def change
    create_table :answer_stats do |t|
      t.references :question, index: true, foreign_key: true
      t.integer :a1
      t.integer :a2
      t.integer :a3
      t.integer :a4

      t.timestamps null: false
    end
  end
end
