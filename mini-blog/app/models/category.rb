class Category < ApplicationRecord
  include CategoryQuery
  validates :name, presence: true

  has_many :posts
end
