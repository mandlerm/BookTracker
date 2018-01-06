class BooksController < ApplicationController
    # before_action :require_login
    # skip_before_action :require_login, only: [:new]
  before_action :authenticate_user!
  # validate :date with :past_date

  def index
    @books = Book.all
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
      flash[:alert] = @book.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
     @book = Book.find_by(:id => params[:id])
  end

  def edit
    @book = Book.find_by(:id => params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.valid?
      flash[:notice] = "Update was successful"
      redirect_to user_book_path(current_user.id, @book)
    else
      flash[:alert] = @book.errors.full_messages.to_sentence
      redirect_to edit_user_book_path(current_user.id,@book)
    end
  end

  def destroy
    # redirect_back fallback_location: user_path(current_user.id)
    Book.find(params[:id]).destroy
    flash[:notice] = "Book deleted"
    redirect_to user_path(current_user)
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :rating, :category_attributes => [:name], :book_records_attributes =>[:date, :comments, :user_id])
    end

  def require_login
    unless session.include? :user_id
      flash[:alert] = "You must be logged in to access this section"
      redirect_to new_user_session_path
    end
  end

 #  def past_date
 #    binding.pry
 #    flash[:alert](:date, "Can't be in the future!") if date > Time.now
 # end
end


# :book_record=> []

      # "book"=>{
      #   "category_attributes"=>{
      #     "name"=>"Business"
      #   },
      # "title"=>"Side Hustle",
      # "author"=>"Chris Guillebeau",
      # "rating"=>"5"
      # , "book_record"=>{
      #     "date(1i)"=>"2018",
      #     "date(2i)"=>"1",
      #     "date(3i)"=>"4",
      #     "comments"=>"reading again"
      #     }
      # },
