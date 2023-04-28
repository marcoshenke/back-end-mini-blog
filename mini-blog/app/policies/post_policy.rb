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
    user.admin? || user.id == post.user_id
  end

  def update?
    user.admin? || user.id == post.user_id
  end

  def destroy?
    user.admin? || user.id == post.user_id
  end
end
