class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category_id, :user_id

  has_many :comments, serializer: CommentSerializer, if: -> { instance_options[:list_comments] }
end
