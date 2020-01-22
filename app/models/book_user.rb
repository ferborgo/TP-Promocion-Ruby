class BookUser < ApplicationRecord
  self.table_name = "books_users"
  enum status: [ :reading, :finished, :abandoned, :to_read ]

  belongs_to :book
  belongs_to :user
  paginates_per 5
end
