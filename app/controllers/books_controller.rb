class BooksController < ApplicationController

  def new
    @book = Book.new
    # @category = Category.new
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      @user_book = UserBook.new(:user_id => current_user.id, :book_id => @book.id, :rating => books_params[:rating], :comments => books_params[:comments], :read => books_params[:read])
      if @user_book.save
        redirect_to book_path @book
      end
    else
      redirect_to 'new_book_path'
    end
  end

  def show
     @book = Book.find_by(:id => params[:id])
  end

  def edit
  end

  def update

  end 

  def destroy
  end

  private
    def books_params
      params.require(:book).permit(:title, :author, :category_attributes => [:name], :user_books =>[:rating, :comments, :read])
    end
end
