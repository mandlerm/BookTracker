class UsersController < ApplicationController
  before_action :get_users_books, only: %i[index show]

  def records
    self.records
  end


  private

  def get_users_books
    @books = current_user.books.all
  end

end
