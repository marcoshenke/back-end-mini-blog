class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and:omniauthable
  #  :trackable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  #  :confirmable
  include DeviseTokenAuth::Concerns::User
  validates :email, :name
end
