class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :answer_stats, :a1, :correct_answer
  end
end
