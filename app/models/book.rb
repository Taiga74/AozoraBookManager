class Book < ApplicationRecord
    validates :title, :author, :publication_date, :url, :word_count, :category, presence: true
end
  