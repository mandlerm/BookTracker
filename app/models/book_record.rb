class BookRecord < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :comments, presence: true


end
