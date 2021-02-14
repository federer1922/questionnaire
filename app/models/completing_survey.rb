class CompletingSurvey < ApplicationRecord
    
  has_many :answers
  belongs_to :questionnaire  
end
    