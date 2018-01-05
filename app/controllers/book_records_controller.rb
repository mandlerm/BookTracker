class BookRecordsController < ApplicationController

  def new
    binding.pry
    @book_record = Book.last.book_records.build
  end
end
