class KindUser < ApplicationRecord
  include KindUserQuery

  has_many :user
end
