class Comment < ApplicationRecord
  include CommentQuery
  belongs_to :post
  validates :comment, presence: true
end
