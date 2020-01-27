class BookUser < ApplicationRecord
  self.table_name = "books_users"
  enum status: [ :reading, :finished, :abandoned, :to_read ]

  STATUS_NAMES = {
    reading: 'reading :D',
    finished: 'finished!',
    abandoned: 'abandoned :(',
    to_read: 'to read...'
  }

  belongs_to :book
  belongs_to :user
  paginates_per 5

  def self.pretty_name(param)
    BookUser::STATUS_NAMES[param.parameterize.underscore.to_sym]
  end
end
