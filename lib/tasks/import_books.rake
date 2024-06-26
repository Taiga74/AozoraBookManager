require 'csv'

namespace :import do
  desc "Import books from CSV"
  task books: :environment do
    csv_file_path = Rails.root.join('lib', 'data', 'books.csv')
    row_count = 0

    CSV.foreach(csv_file_path, headers: true) do |row|
      break if row_count >= 5000
      
      Book.create(
        title: row['作品名'],
        author: row['姓名'],
        publication_date: row['公開日'],
        url: row['XHTML/HTMLファイルURL'],
        word_count: row['文字数'],
        category: row['カテゴリ']
      )
      
      row_count += 1
    end
  end
end
