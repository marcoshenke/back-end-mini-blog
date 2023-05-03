class Category < ApplicationRecord
  include CategoryQuery
  validates :name, presence: true

  has_many :posts, dependent: :delete_all
end
