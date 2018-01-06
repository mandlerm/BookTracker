class BooksController < ApplicationController
    # before_action :require_login
    # skip_before_action :require_login, only: [:new]
  before_action :authenticate_user!
  before_action :find_book, only: %i[show edit update destroy]

  def index
    @books = Book.all
  end

  # def most_comments
  #     books/most_comments
  #
  #     @most_comment = Book.most_comments
  #
  # end


  def new
    @book = Book.new
    @book_record = @book.book_records.build
    @category = @book.build_category
  end

  def create
    @book = Book.new(book_params)
    if @book.save
        redirect_to user_path(current_user.id)
    else
      flash[:alert] = @book.errors.full_messages.to_sentence
      render :new
    end
  end

  # def show
  # end
  #
  # def edit
  # end

  def update
    @book.update(book_params)
    if @book.valid?
      flash[:notice] = "Update was successful"
      redirect_to user_book_path(current_user.id, @book), notice: "You must be logged in to access this section"
    else
      flash[:alert] = @book.errors.full_messages.to_sentence
      redirect_to edit_user_book_path(current_user.id,@book)
    end
  end

  def destroy
    title = @book.title
    if @book.delete
    redirect_to user_path(current_user), notice: "#{title} was successfully deleted"
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :rating, :category_attributes => [:name], :book_records_attributes =>[:date, :comments, :user_id])
    end

  # def require_login
  #   unless session.include? :user_id
  #     # flash[:alert] = "You must be logged in to access this section"
  #     redirect_to new_user_session_path, alert: "You must be logged in to access this section"
  #   end
  # end

  def find_book
    @book = Book.find_by(:id => params[:id])
  end
end
