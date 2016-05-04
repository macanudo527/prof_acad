class ChangeDataTypeForQuestions < ActiveRecord::Migration
  def change
    change_column :questions, :question, :text
    change_column :questions, :a1, :text
    change_column :questions, :a2, :text
    change_column :questions, :a3, :text
    change_column :questions, :a4, :text
  end
end
