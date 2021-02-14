class Answer < ApplicationRecord

  belongs_to :question
  belongs_to :completing_survey

  validates :open_ended_question, length: { maximum: 140 }
end
    