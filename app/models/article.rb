class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :text, presence: true

  has_many :comments
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
