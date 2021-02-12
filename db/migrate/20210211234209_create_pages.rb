class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.integer :number
      t.timestamps
    end

    add_reference :pages, :questionnaire, index: true
  end
end
