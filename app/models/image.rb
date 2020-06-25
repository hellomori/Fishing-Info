class Image < ApplicationRecord
  # Association
  belongs_to :post
  mount_uploader :image, ImageUploader

  # Validation
  validates :src, presence: true
end
