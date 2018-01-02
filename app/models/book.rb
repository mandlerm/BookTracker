class Book < ApplicationRecord
  has_many :users
  has_many :book_categories
  has_many :categories, through: :book_categories
  # accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    binding.pry
    category_attributes.values.each do |category_attributes|
      category = Category.find_or_create_by(category_attributes.titilize)
      self.categories << category if item.persisted?
    end
  end

  def book_categories_attributes=(book_categories)
    binding.pry
    self.category.each do |category|
      BookCategory.create(:book_id => self.id, :category_id => category.id, :rating => book_categories[:rating] , :comments => book_categories[:comments])
    end
  end
end
