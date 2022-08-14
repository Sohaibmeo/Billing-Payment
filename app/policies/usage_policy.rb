# frozen_string_literal: true

class UsagePolicy < ApplicationPolicy
  class Scope < Scope
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
end
