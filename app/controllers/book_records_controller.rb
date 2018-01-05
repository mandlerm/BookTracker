class BookRecordsController < ApplicationController
  # before_action :require_login

  def new
    binding.pry
    @book_record = BookRecord.new(user_id: current_user.id, book_id: params[:book_id])
  end

  private

  def require_login
    unless session.include? :user_id
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_session_path
    end
  end
end
