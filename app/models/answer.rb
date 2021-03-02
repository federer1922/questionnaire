class Answer < ApplicationRecord

  belongs_to :question
  belongs_to :completing_survey

  validates :open_ended_question, length: { maximum: 140 } 

  validate :valid_select
    def valid_select
      if question.kind == "single_choice"
        if question.select_possible_answers.include?(single_choice_question)
          errors.add(:single_choice_question, 'must be selected')
        end
      end
    end

  validate :valid_answer
    def valid_answer
      if question.kind == "open_ended" && !question.requiring_answer.nil?
        if !open_ended_question.present?
          errors.add(:open_ended_question, 'must be present')
        end
      elsif question.kind == "date" && !question.requiring_answer.nil?
        if !date_selection.present?
          errors.add(:date_selection, 'must be present')
        end
      elsif question.kind == "single_choice" && !question.requiring_answer.nil?
        if !single_choice_question.present?
          errors.add(:single_choice_question, 'must be present')
        end
      end 
    end
end
    