class User < ApplicationRecord
  has_many :favorites
  has_many :favorite_books, through: :favorites, source: :book
  has_many :bookmarks
  has_many :bookmarked_books, through: :bookmarks, source: :book
  has_many :reviews, dependent: :destroy

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end