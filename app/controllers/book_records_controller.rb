class BookRecordsController < ApplicationController
  # before_action :require_login

  def new
    @book_record = BookRecord.new(user_id: current_user.id, book_id: params[:book_id])
  end

  def create
    record = BookRecord.new(book_record_params)
    if record.save
      redirect_to book_path(book_record_params[:book_id])
    else
      redirect_to book_path(book_record_params[:book_id])
    end
  end

  private

  def require_login
    unless session.include? :user_id
      flash[:alert] = "You must be logged in to access this section"
      redirect_to new_user_session_path
    end
  end

  def book_record_params
    params.require(:book_record).permit(:user_id, :book_id, :date, :comments)
  end
end
