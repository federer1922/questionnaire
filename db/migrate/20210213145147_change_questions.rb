class ChangeQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :select_possible_answers, :string
    rename_column :questions, :question_type, :type
    rename_column :questions, :question_content, :content
  end
end
