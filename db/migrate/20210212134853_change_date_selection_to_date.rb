class ChangeDateSelectionToDate < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :date_selection
    add_column :answers, :date_selection, :date
  end
end
