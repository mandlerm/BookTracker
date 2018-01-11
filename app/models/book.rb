class Book < ApplicationRecord
  has_many :book_records
  has_one :users, :through => :book_records
  belongs_to :category

  validates :title, presence: true
  validates :category, presence: true   #is this the right place for this?
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }, :allow_blank => true
  scope :favorites, -> { where(rating: '5') }


  def category_attributes=(category_attribute)
      category = Category.find_or_create_by(category_attribute)
      self.category = category if category.persisted?
  end

  def book_records_attributes=(user_book_params)
    self.book_records.build(user_book_params["0"])
  end

  def bookrecords
    self.book_records.map do |record|
        record
    end
  end

  def order_records
      self.book_records.sort_by &:date
  end

  # def self.favorites
  #   where("rating = 5")
  # end

  # def self.most_comments
  #   binding.pry
  #   Book.joins(:book_records).where.not('book_records.comments == NULL').group('book_records.book_id').order('COUNT(book_records.book_id) DESC').limit(1)
  # end
end
