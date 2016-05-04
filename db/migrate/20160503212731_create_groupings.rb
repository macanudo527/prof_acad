class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
      t.string :name
      t.references :test, index: true, foreign_key: true
      t.integer :per_page
      t.integer :order

      t.timestamps null: false
    end
  end
end
