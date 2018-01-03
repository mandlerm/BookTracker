class UserBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  # validates :read, presence: true
end
