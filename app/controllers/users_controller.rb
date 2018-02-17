class UsersController < ApplicationController
  before_action :get_users_books, only: %i[index show]

  def records
    self.records
  end

  def show
    respond_to do |f|
      f.html
      f.json {render json: current_user}
    end
  end

  def index
    respond_to do |f|
      f.html
      f.json {render json: @books}
    end
  end

  private

  def get_users_books
    @books = current_user.books.all.distinct
  end

end
