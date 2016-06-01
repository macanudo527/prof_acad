class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :questions, :correct
  end
end
