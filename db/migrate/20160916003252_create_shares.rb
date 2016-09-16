class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :question_id
      t.integer :grouping_id

      t.timestamps null: false
    end
    add_index :shares, :question_id
    add_index :shares, :grouping_id
    add_index :shares, [:question_id, :grouping_id], unique: true    
    
  end
end
