class Option < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validates :points, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
