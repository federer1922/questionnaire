class AddQuestionsToAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :page_id
    add_reference :answers, :question, index: true
  end
end
