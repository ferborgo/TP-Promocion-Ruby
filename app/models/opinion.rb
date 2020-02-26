class Opinion < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :likes, dependent: :destroy

  validates :user, :book, :stars, presence: true
  validates_associated :book, :user
  validates :pages, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }
  paginates_per 3
end
