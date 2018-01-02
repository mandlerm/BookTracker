class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    raise params.inspect
  end


  private
    def books_params
      params.require(:book).permit(:title, :author, :book_category =>
                      {:rating, :comments}, :category => {:category})
    end

end

#
# "book"=>{
#   "title"=>"Story of the World",
#   "author"=>"Susan Bauer",
#   "book_category"=>{
#     "rating"=>"5",
#     "comments"=>"great history book"
#   },
#   "category"=>{
#     "category"=>"History"
#   }
# },
