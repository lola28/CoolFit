class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

end
