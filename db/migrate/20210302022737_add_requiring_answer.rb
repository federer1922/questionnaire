class AddRequiringAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :requiring_answer, :string
  end
end
