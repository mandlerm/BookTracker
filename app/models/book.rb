class Book < ApplicationRecord
  has_many :users
  has_many :book_categories
  has_many :categories, through: :book_categories

end
