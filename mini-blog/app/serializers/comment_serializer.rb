class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :post_id, :created_at
end
