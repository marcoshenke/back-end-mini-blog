class Post < ApplicationRecord
  validates :title, :description, presence: true
  validates :title, lenght: { minimum: 5 }
  validates :description, lenght: { minimum: 15 }
end
