class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    binding.pry
    @book = Book.new()
  end


  private
    def books_params
      params.require(:book).permit(:title, :author, :read, :book_categories =>
                      [:rating, :comments], :categories_attributes => [:name])
    end

end
