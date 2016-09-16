class RemoveGroupingIdFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :grouping_id, :integer
  end
end
