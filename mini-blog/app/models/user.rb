class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and:omniauthable
  #  :trackable
  extend Devise::Models
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  #  :confirmable
  include DeviseTokenAuth::Concerns::User
end
