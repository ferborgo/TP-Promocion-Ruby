class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :users
  has_many :opinions
  belongs_to :genre
end