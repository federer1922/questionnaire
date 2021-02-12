class AddQuestionnairesToCompletingSurveys < ActiveRecord::Migration[6.0]
  def change
    add_reference :completing_surveys, :questionnaire, index: true
  end
end
