class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and:omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable
  include DeviseTokenAuth::Concerns::User
end
