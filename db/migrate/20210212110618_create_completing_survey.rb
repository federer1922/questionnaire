class CreateCompletingSurvey < ActiveRecord::Migration[6.0]
  def change
    create_table :completing_surveys do |t|
      t.timestamps
    end
  end
end
