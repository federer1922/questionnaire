class Questionnaire < ApplicationRecord

  has_many :pages
  has_many :completing_surveys

  validates :name, presence: true

end