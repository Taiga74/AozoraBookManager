class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :publication_date
      t.string :url
      t.integer :word_count
      t.string :category

      t.timestamps
    end
  end
end
