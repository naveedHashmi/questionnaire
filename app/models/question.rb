class Question < ApplicationRecord
  belongs_to :questionnaire, inverse_of: :questions
  has_many :options, inverse_of: :question, dependent: :destroy
  accepts_nested_attributes_for :options, allow_destroy: true

  validates :title, presence: true
  validates :score, numericality: { greater_than: 0 }

  validate :options_score_not_greater_than_question_score

  private

  def options_score_not_greater_than_question_score
    if options.sum(:points) > score
      errors.add(:options, "total points can't be greater than question score")
    end
  end
end
