class Questionnaire < ApplicationRecord
  has_many :questions, inverse_of: :questionnaire
  accepts_nested_attributes_for :questions, allow_destroy: true

  validates :title, presence: true, uniqueness: true
  validates :questions, length: { minimum: 1, message: 'At least one question is required.' }
end
