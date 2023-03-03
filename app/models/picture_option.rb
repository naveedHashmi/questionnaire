class PictureOption < ApplicationRecord
  belongs_to :question
  has_one_attached :picture
end
