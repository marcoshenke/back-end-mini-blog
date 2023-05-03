class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :posts, serializer: PostSerializer, if: -> { instance_options[:list_posts] }
end
