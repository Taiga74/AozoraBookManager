class ReviewsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @book = Book.find(params[:id])
      @review = @book.reviews.new(review_params)
      @review.user = current_user
  
      if @review.save
        redirect_to book_path(@book), notice: 'Review was successfully created.'
      else
        redirect_to book_path(@book), alert: 'Failed to create review.'
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
  end
  