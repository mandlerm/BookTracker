class BookRecordsController < ApplicationController

  before_action :authenticate_user!

  def new
    @book_record = BookRecord.new(user_id: current_user.id, book_id: params[:book_id])
  end

  def create
    record = BookRecord.new(book_record_params)

    if !record.comments.empty? && record.save
      redirect_to user_book_path(current_user.id, book_record_params[:book_id])
    else
      redirect_to user_book_path(current_user.id, book_record_params[:book_id]),  alert: "Did not save. Comment is required. You may try again."
    end
  end

  private

  def book_record_params
    params.require(:book_record).permit(:user_id, :book_id, :date, :comments)
  end

end
