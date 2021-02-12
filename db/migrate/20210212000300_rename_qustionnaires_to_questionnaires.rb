class RenameQustionnairesToQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    rename_table :qustionnaires, :questionnaires
  end
end
