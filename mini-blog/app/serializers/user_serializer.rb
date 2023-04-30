class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :admin
end
