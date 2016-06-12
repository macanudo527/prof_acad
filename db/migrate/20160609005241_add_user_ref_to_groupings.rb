class AddUserRefToGroupings < ActiveRecord::Migration
  def change
    add_reference :groupings, :user, index: true, foreign_key: true
  end
end
