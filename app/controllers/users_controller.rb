class UsersController < ApplicationController

  def index
    # sort books.
    @books = current_user.books.all
    # give option to view Alphabetically.  Only those read. Only those not read
    # by category
  end

  def show
    @books = current_user.books.all
  end

  def records
    binding.pry
    self.records
  end

end
