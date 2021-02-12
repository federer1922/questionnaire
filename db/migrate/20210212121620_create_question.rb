class CreateQuestion < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :question_content
      t.string :question_type
      t.timestamps
    end
    add_reference :questions, :page, index: true
  end
end
