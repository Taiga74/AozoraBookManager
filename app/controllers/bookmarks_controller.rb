class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:id])
    current_user.bookmarked_books << @book
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    current_user.bookmarked_books.delete(@book)
    redirect_to book_path(@book)
  end

  def index
    @bookmarked_books = current_user.bookmarked_books
  end
end