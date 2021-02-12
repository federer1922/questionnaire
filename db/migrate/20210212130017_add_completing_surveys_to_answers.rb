class AddCompletingSurveysToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_reference :answers, :completing_survey, index: true
  end
end
