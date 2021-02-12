class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :open_ended_question
      t.string :date_selection
      t.string :single_choice_question
      t.timestamps
    end

    add_reference :questions, :page, index: true
  end
end
