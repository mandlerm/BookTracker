User
  :name
  has_many :books

Topic
  :name
  has_many :books_topics
  has_many :books, through: :book_topics

Book_topics
  :book_id
  :topic_id

Purpose
  :purpose (academic, enjoyment, work-related, reference,   )


book_purpose
  :book_id
  :purpose_id
  :comment  (each category selection allows comments - great resource for Ruby. )
  belongs_to :book
  belongs_to :category

Books
  :title
  :author
  :read  --boolean
  :rating
  belongs_to :user
  has_many :book_categories
  has_many :categories, through: :book_categories
  has_one :user, through: :book_categories

book has many categories through books_categories

##############
Category  (how to prefill these)
  :name
  :has_many_books

Book
  :title
  :author
  :category
  :rating
belongs_to :category
has_many :book_records
belongs_to :user, through: :book_records


User
  :name
has_many :book_records
has_many :books, through: :book_records

book_record
 :user_id
 :book_id
 :date
 :comments
belongs_to :user
belongs_to :book

##
C reate book -
Retrieve - see book show page and all book records (notes and dates)
Update -- add new notes. Change rating
Delete - remove the book

Book record CRUD goes through BOOK   
book show page shows each record.   update link.  (no delete option?)


 - [ ] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
 - [ ] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)

 - [ ] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)




Guest  < User
  name
has_many visits
has_many guests through visits


visit
  guest_id
  host_id
  comment
  belongs_to guest
  belongs_to host

Host  < User
  name
  location
has_many visits
has_many guests through visits

User
  can be either host or guest


Display all visits as a host
Display all visits as a guest
(search for location visit)
