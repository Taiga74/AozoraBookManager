class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:id])
    current_user.favorite_books << @book
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    current_user.favorite_books.delete(@book)
    redirect_to book_path(@book)
  end

  def index
    @favorite_books = current_user.favorite_books
  end
end