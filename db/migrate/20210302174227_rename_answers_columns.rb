class RenameAnswersColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :answers, :open_ended_question, :open_answer
    rename_column :answers, :date_selection, :date
    rename_column :answers, :single_choice_question, :single_answer
  end
end
