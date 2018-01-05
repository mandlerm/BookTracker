class BookRecordsController < ApplicationController
  before_action :require_login

  def new

    binding.pry
    @book_record = Book.last.book_records.build
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
