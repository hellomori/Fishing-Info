class Cooking < ApplicationRecord
validates :title, presence: true
validates :image, presence: true
end
