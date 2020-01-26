class Opinion < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :likes, dependent: :destroy

  paginates_per 3
end
