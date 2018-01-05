class Category < ApplicationRecord
  has_many :books

  validates :name, presence: true


  def book_attributes=(book_attributes)

  end


  def user_books_attributes=(user_books_attributes)

  end
end
