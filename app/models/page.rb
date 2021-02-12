class Page < ApplicationRecord

  has_many :questions
  belongs_to :questionnaire
end
  