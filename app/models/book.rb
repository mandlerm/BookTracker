class Book < ApplicationRecord
  has_many :users
  has_many :book_categories
  has_many :categories, through: :book_categories
  accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attributes|
      category = Category.find_or_create_by(category_attributes)
      self.categories << category
      BookCategory.create(:book_id => self.id, :category_id => category.id, :rating =>   , :comment =>)
    end
  end

  def book_category=(book_categories)
    BookCategory.create(:book_id => self.id, :category_id => )
    t.integer "book_id"
    t.integer "category_id"
    rating
    comment
  end
end
