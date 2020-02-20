require 'elasticsearch/model'

class Book < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :author, type: :object do
        indexes :first_name, type: :text
        indexes :last_name, type: :text
      end
      indexes :genre, type: :object do
        indexes :name, type: :text
      end
      indexes :title, type: :text
      indexes :pages, type: :text
    end
  end

  def as_indexed_json(options = {})
    self.as_json(
      only: [:id, :title, :pages],
      include: {
        author: {
          only: [:id, :first_name, :last_name]
        },
        genre: {
          only: [:id, :name]
        }
      }
    )
  end


  belongs_to :author
  has_and_belongs_to_many :users
  has_many :opinions
  belongs_to :genre
end
Book.import()
