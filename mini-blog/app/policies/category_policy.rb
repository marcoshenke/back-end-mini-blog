class CategoryPolicy < ApplicationPolicy
  def new?
    user.present? && user&.admin
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present? && user&.admin
  end

  def update?
    user.present? && user&.admin
  end

  def destroy?
    user.present? && user&.admin
  end
end
