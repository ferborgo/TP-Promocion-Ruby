class Author < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  has_many :books

  validates :first_name, :last_name, presence: true
end
