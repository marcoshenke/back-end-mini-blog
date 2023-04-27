class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def show?
    true
  end

  def create?
    user.kind_user_id == 2 || user.id == record.user.id
  end

  def update?
    user.kind_user_id == 2 || user.id == record.user.id
  end

  def destroy?
    user.kind_user_id == 2 || user.id == record.user.id
  end
end
