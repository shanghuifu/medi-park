class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_articles, through: :likes, source: :article

  def already_liked?(article)
    self.likes.exists?(article_id: article.id)
  end
end
