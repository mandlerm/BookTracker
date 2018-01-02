class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
  end

  def edit
  end


  private
    def books_params
      params.require(:book).permit(:title, :author, :read, :categories_attributes => [:name])
    end



end
