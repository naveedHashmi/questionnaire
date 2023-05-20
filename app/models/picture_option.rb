class PictureOption < ApplicationRecord
  belongs_to :question
  has_one_attached :picture

  def picture_url
    Rails.application.routes.url_helpers.rails_blob_url(picture) if picture.attached?
  end
end
