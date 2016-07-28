class CreateAnswerSessions < ActiveRecord::Migration
  def change
    create_table :answer_sessions do |t|
      t.references :grouping, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
