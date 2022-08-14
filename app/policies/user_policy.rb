# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @user.admin?
  end

  def show?
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
end
