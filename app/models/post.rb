class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments

  with_options presence: true do
    validates :image
    validates :area
    validates :rank
  end
end
