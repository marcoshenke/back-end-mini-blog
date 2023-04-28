class PostPolicy < ApplicationPolicy
  def new?
    user_is_owner_of_record?
  end

  def show?
    user_is_owner_of_record? || @record.published
  end

  def create?
    user.admin? || user_is_owner_of_record?
  end

  def update?
    user.admin? || user_is_owner_of_record?
  end

  def destroy?
    user.admin? || user_is_owner_of_record?
  end

  def user_is_owner_of_record?
    @user == @record.user
  end
end
