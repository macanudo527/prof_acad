class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :questions, :a1, :correct_answer
  end
end
