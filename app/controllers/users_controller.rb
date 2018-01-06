class UsersController < ApplicationController

  def index

    @books = current_user.books.all
  end

  def show
    @books = current_user.books.all
  end

  def records
    self.records
  end

end
