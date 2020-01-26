class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :book

  paginates_per 3
end
