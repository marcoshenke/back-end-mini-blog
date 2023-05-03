class CommentPolicy < ApplicationPolicy
  def new?
    user_is_owner_of_record?
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (user&.admin || user_is_owner_of_record?)
  end

  def destroy?
    user.present? && (user&.admin || user_is_owner_of_record?)
  end

  def user_is_owner_of_record?
    @user == @record.user
  end
end
