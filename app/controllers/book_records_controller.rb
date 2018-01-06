class BookRecordsController < ApplicationController
  # before_action :require_login
  # validate :date with :past_date
  def new
    binding.pry
    @book_record = BookRecord.new(user_id: current_user.id, book_id: params[:book_id])
  end

  def create
    record = BookRecord.new(book_record_params)
    if record.save
      redirect_to user_book_path(current_user.id, book_record_params[:book_id])
    else
      redirect_to user_book_path(current_user.id, book_record_params[:book_id])
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

  #  def past_date
  #    binding.pry
  #    flash[:alert](:date, "Can't be in the future!") if date > Time.now
  # end
end
