class Book < ApplicationRecord
  has_many :book_records
  has_one :users, :through => :book_records
  belongs_to :category

  validates :title, presence: true
  validates :category, presence: true   #is this the right place for this?
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }, :allow_blank => true


  def category_attributes=(category_attribute)
      category = Category.find_or_create_by(category_attribute)
      self.category = category if category.persisted?
  end

  def book_records_attributes=(user_book_params)
    self.book_records.build(user_book_params["0"])
  end

  def records
    self.book_records.map do |record|
        record
    end
  end


end
