class Book < ApplicationRecord
  has_many :user_books
  has_many :users, :through => :user_books
  belongs_to :category

  # accepts_nested_attributes_for :categories

  def category_attributes=(category_attribute)
      category = Category.find_or_create_by(category_attribute)
      self.category = category if category.persisted?
  end

  def user_books=(user_book_params)
      
  end
end
