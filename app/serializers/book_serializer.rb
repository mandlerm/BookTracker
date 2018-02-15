class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :rating, :category_id

  has_many :book_records
  has_one :users, :through => :book_records
  belongs_to :category

end


# @mandlerm I'd also look into virtual attributes, in some cases you don't need to include the entire association, you can just take a bit of it, in that case you can write a model method that returns what you need and just add that as an attribute on your serializer as if it were a column on your db table
