class RenameType < ActiveRecord::Migration[6.0]
  def change
    rename_column :questions, :type, :kind
  end
end
