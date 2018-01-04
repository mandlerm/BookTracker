class Book < ApplicationRecord
  has_many :book_records
  belongs_to :users, :through => :book_records
  belongs_to :category

  validates :title, presence: true
  validates :category, presence: true


  def category_attributes=(category_attribute)
      category = Category.find_or_create_by(category_attribute)
      self.category = category if category.persisted?
  end

  def user_books=(user_book_params)

  end

  def read?
    binding.pry
    self.user_book.read?
  end
end
