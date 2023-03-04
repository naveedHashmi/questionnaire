class Question < ApplicationRecord
  belongs_to :questionnaire, inverse_of: :questions
  has_many :options, inverse_of: :question, dependent: :destroy
  has_many :range_options, dependent: :destroy
  has_many :picture_options, dependent: :destroy

  accepts_nested_attributes_for :picture_options, allow_destroy: true
  accepts_nested_attributes_for :range_options, allow_destroy: true
  accepts_nested_attributes_for :options, allow_destroy: true

  enum question_type: { single_choice: 0, multiple_choice: 1, range: 2, picture: 3 }

  validates :title, presence: true


  def all_options
    options + range_options + picture_options
  end
end
