class User < ApplicationRecord
  validates :name, :email, :encrypted_password, :kind, presence: true
end
