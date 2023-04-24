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

  has_many :posts, dependent: :destroy
  has_one :category
  has_many :comments

  private

  def set_uid
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end
end
