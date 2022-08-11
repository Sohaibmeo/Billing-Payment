class SubscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    @user
  end

  def show?
    @user
  end

  def create?
    @user
  end

  def new?
    create?
  end

  def update?
    @user
  end

  def edit?
    update?
  end

  def destroy?
    @user
  end
end
