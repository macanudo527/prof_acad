class AddDescriptionToGroupings < ActiveRecord::Migration
  def change
    add_column :groupings, :description, :text
  end
end
