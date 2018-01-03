class Book < ApplicationRecord
  has_many :user_books
  has_many :users, :through => :user_books
  belongs_to :category

  # accepts_nested_attributes_for :categories

  def category_attributes=(category_attributes)
    binding.pry
    category_attributes.values.each do |category_attributes|
      category = Category.find_or_create_by(category_attributes.titilize)
      self.categories << category if item.persisted?
    end
  end

  def category=(category)
    
  end


end
