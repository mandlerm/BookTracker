class BookRecord < ApplicationRecord
  belongs_to :user
  belongs_to :book
  # def self.most_comments
  #   binding.pry
  #   Book.joins(:book_records).where.not('book_records.comments == NULL').group('book_records.book_id').order('COUNT(book_records.book_id) DESC').limit(1)
  # end
end
