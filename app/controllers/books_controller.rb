class BooksController < ApplicationController
  def index
    @books = Book.all
    @categories = Book.select(:category).distinct
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    @books = Book.all

    if params[:query].present?
      @books = @books.where("title LIKE ? OR author LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    if params[:category].present?
      @books = @books.where(category: params[:category])
    end

    @categories = Book.select(:category).distinct

    render :index
  end
end