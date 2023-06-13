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
    # record.chair.user_id != user -- este codigo no funciona.
    # Le pregunte a Segundo y me dijo que seria muy complicado para este proyecto arreglarlo
    # asi que lo deje en true y saque las vistas nada mas
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
