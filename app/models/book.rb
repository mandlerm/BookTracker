class Book < ApplicationRecord
  has_one :user_book
  has_many :users, :through => :user_book
  belongs_to :category

  validates :title, presence: true
  validates :category, presence: true


  def category_attributes=(category_attribute)
      category = Category.find_or_create_by(category_attribute)
      self.category = category if category.persisted?
  end

  def user_books=(user_book_params)

  end

private
  def read?
    self.user_book.read?
  end
end
