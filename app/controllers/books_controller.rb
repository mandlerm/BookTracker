class BooksController < ApplicationController

  def new
    @book = Book.new
    @category = Category.new
  end

  def create
    @book = Book.new(books_params)
binding.pry
  end

  def edit
  end


  private
    def books_params
      params.require(:book).permit(:title, :author, :category_attributes => [:name], :user_books =>[:rating, :comments, :read])
    end
end
