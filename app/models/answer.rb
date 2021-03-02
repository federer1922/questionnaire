class Answer < ApplicationRecord

  belongs_to :question
  belongs_to :completing_survey

  validates :open_answer, length: { maximum: 140 } 

  validate :valid_select
    def valid_select
      if question.kind == "single_choice"
        if !question.select_possible_answers.include?(single_answer)
          errors.add(:single_answer, 'must be selected')
        end
      end
    end

  validate :valid_answer
    def valid_answer
      if question.kind == "open_ended" && !question.requiring_answer.nil?
        if !open_answer.present?
          errors.add(:open_answer, 'must be given')
        end
      elsif question.kind == "date" && !question.requiring_answer.nil?
        if !date.present?
          errors.add(:date, 'must be chosen')
        end
      elsif question.kind == "single_choice" && !question.requiring_answer.nil?
        if !single_answer.present?
          errors.add(:single_answer, 'must be present')
        end
      end 
    end
end
    