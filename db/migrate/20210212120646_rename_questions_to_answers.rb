class RenameQuestionsToAnswers < ActiveRecord::Migration[6.0]
  def change
    rename_table :questions, :answers
  end
end
