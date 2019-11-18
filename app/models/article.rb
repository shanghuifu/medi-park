class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :text, presence: true

  has_many :comments
end
