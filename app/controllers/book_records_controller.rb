class BookRecordsController < ApplicationController
  before_action :require_login

  def new

    binding.pry
    @book_record = Book.last.book_records.build
  end
end
