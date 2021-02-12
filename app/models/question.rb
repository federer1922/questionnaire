class Question < ApplicationRecord

  belongs_to :page
  has_many :answers
end