class BooksController < ApplicationController
    before_action :require_login
  def index
    @books = Books.all
  end

  def new
    @book = Book.new
    @book_record = @book.book_records.build
    @category = @book.build_category
  end

  def create
    @book = Book.new(book_params)

    if @book.save
        redirect_to book_path @book
    else
      binding.pry
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
    redirect_to book_path @book
  end

  def destroy


  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :rating, :category_attributes => [:name], :book_records_attributes =>[:date, :comments, :user_id])
    end
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
