class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_taggable
  belongs_to :user
  has_many :comments

  with_options presence: true do
    validates :image
    validates :area
    validates :rank
  end

  def self.search(search)
    return Post.all unless search
    Post.where("area LIKE(?) or title LIKE(?) or content LIKE(?) or rank LIKE(?)", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
