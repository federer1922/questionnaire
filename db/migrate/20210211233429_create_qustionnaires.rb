class CreateQustionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :qustionnaires do |t|
      t.string :name
      t.timestamps 
    end
  end
end
