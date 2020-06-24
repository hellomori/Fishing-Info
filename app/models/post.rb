class Post < ApplicationRecord
  # Association
  acts_as_taggable
  belongs_to :user
  has_many :comments
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  # Validation
  with_options presence: true do
    validates :area_id
    validates :rank
  end

  def self.search(search)
    return Post.all unless search
    Post.where("area LIKE(?) or title LIKE(?) or content LIKE(?) or rank LIKE(?)", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end