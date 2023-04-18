class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :encrypted_password, :kind
end
