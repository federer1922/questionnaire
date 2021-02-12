class Completing_survey < ApplicationRecord
    
  has_many :answers
  belongs_to :questionnaire  
end
    