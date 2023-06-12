class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
      # scope.where(user != user)
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    #record.chair.user_id != user
    true
  end

  def destroy?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end
end
