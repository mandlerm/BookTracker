class BooksController < ApplicationController
    # before_action :require_login
    # skip_before_action :require_login, only: [:new]
  before_action :authenticate_user!
  before_action :find_book, only: %i[show edit update destroy]

  def index
    @books = Book.all
  end

  def favorites
    @favorites = Book.favorites.distinct
  end

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
      flash.now[:alert] = @book.errors.full_messages.to_sentence
      render :new
      # redirect_to new_user_book_path, alert: @book.errors.full_messages.to_sentence
    end
  end

  def update
    @book.update(book_params)
    if @book.valid?
      redirect_to user_book_path(current_user.id, @book), notice: "Update was successful"
    else
      flash.now[:alert] = @book.errors.full_messages.to_sentence
      render :edit
      # redirect_to edit_user_book_path(current_user.id,@book), alert: @book.errors.full_messages.to_sentence
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

    def find_book
      @book = Book.find_by(:id => params[:id])
    end
end
