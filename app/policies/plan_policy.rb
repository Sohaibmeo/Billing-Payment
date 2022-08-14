# frozen_string_literal: true

class PlanPolicy < ApplicationPolicy
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
end
