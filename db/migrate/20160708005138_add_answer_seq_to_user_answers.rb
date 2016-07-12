class AddAnswerSeqToUserAnswers < ActiveRecord::Migration
  def change
    add_column :user_answers, :answer_seq, :integer
  end
end
