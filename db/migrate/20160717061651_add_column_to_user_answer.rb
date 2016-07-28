class AddColumnToUserAnswer < ActiveRecord::Migration
  def change
    add_reference :user_answers, :answer_session, index: true, foreign_key: true
  end
end
