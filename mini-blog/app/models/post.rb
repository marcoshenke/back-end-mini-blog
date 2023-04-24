class Post < ApplicationRecord
  include PostQuery

  validates :title, :description, presence: true
  validates :title, length: { minimum: 5 }
  validates :description, length: { minimum: 15 }

  has_many :comments, dependent: :delete_all
  has_one :category
  belongs_to :user
end
