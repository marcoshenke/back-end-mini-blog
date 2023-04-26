class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.kind == 2
  end

  def update?
    user.kind == 2
  end

  def destroy?
    user.kind == 2
  end
end
