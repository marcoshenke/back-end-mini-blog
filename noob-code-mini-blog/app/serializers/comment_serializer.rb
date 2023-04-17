class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :created_at
end
