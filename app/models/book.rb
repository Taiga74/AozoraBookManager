class Book < ApplicationRecord
    validates :title, :author, :publication_date, :url, :word_count, :category, presence: true
    has_many :favorites
    has_many :bookmarked_by, through: :favorites, source: :user
    has_many :bookmarks
    has_many :favorited_by, through: :bookmarks, source: :user
    has_many :favorites
    has_many :bookmarked_books
    has_many :reviews, dependent: :destroy
end
  