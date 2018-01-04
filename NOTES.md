User
  :name
  has_many :books


Category
  :name
  has_many :books_categories
  has_many :books, through: :book_categories

book_categories
  :user_id
  :book_id
  :notes
  :rating
  belongs_to :book
  belongs_to :category

Books
  :title
  :author
  belongs_to :user
  has_many :book_categories
  has_many :categories, through: :book_categories
  has_one :user, through: :book_categories
